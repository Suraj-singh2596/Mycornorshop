

$('.onlinePay2').click(function (e) {
    e.stopImmediatePropagation();
    onBuyClicked();
})

const supportedInstruments = [
    {
        supportedMethods: ['https://tez.google.com/pay'],
        data: {
            pa: 'psdps.05@cmsidfc',
            pn: 'PRAESIDIO DOCTORPLUS PRIVATE LIMITE',
            tr: '1234ABCD',  // your custom transaction reference ID
            url: '../Components/scheduler.aspx',
            mc: '8099', // your merchant category code
            tn: 'Purchase in Merchant',
        },
    }
];

const details = {
    total: {
        label: 'Total',
        amount: {
            currency: 'INR',
            value: '1', // sample amount
        },
    },
    displayItems: [{
        label: 'Original Amount',
        amount: {
            currency: 'INR',
            value: '1',
        },
    }],
};

let request = null;
try {
    request = new PaymentRequest(supportedInstruments, details);
}
catch (e) {
    console.log('Payment Request Error: ' + e.message);

}
if (!request) {
    console.log('Web payments are not supported in this browser.');

}

// Global key for canMakepayment cache.
const canMakePaymentCache = 'canMakePaymentCache';
 
function checkCanMakePayment(request) {
    // Check canMakePayment cache, use cache result directly if it exists.
    if (sessionStorage.hasOwnProperty(canMakePaymentCache)) {
        return Promise.resolve(JSON.parse(sessionStorage[canMakePaymentCache]));
    }

    // If canMakePayment() isn't available, default to assume the method is
    // supported.
    var canMakePaymentPromise = Promise.resolve(true);

    // Feature detect canMakePayment().
    if (request.canMakePayment) {
        canMakePaymentPromise = request.canMakePayment();
    }

    return canMakePaymentPromise
        .then((result) => {
            // Store the result in cache for future usage.
            sessionStorage[canMakePaymentCache] = result;
            return result;
        })
        .catch((err) => {
            console.log('Error calling canMakePayment: ' + err);
        });
}

/** Launches payment request flow when user taps on buy button. */
function onBuyClicked() {
    if (!window.PaymentRequest) {
        console.log('Web payments are not supported in this browser.');
        return;
    }

    // Create supported payment method.
    const supportedInstruments = [
        {
            supportedMethods: ['https://tez.google.com/pay'],
            data: {
                pa: 'psdps.05@cmsidfc',
                pn: 'PRAESIDIO DOCTORPLUS PRIVATE LIMITE',
                tr: '1234ABCD',  // your custom transaction reference ID
                url: '../Components/scheduler.aspx',
                mc: '8099', // your merchant category code
                tn: 'Purchase in Merchant',
            },
        }
    ];

    // Create order detail data.
    const details = {
        total: {
            label: 'Total',
            amount: {
                currency: 'INR',
                value: '1', // sample amount
            },
        },
        displayItems: [{
            label: 'Original Amount',
            amount: {
                currency: 'INR',
                value: '1',
            },
        }],
    };

    // Create payment request object.
    let request = null;
    try {
        request = new PaymentRequest(supportedInstruments, details);
    } catch (e) {
        console.log('Payment Request Error: ' + e.message);

    }
    if (!request) {
        console.log('Web payments are not supported in this browser.');

    }

    var canMakePaymentPromise = checkCanMakePayment(request);
    canMakePaymentPromise
        .then((result) => {
            showPaymentUI(request, result);
        })
        .catch((err) => {
            console.log('Error calling checkCanMakePayment: ' + err);
        });
}

/**
* Show the payment request UI.
*
* @private
* @param {PaymentRequest} request The payment request object.
* @param {Promise} canMakePayment The promise for whether can make payment.
*/
function showPaymentUI(request, canMakePayment) {
    if (!canMakePayment) {
        handleNotReadyToPay();
        return;
    }

    // Set payment timeout.
    let paymentTimeout = window.setTimeout(function () {
        window.clearTimeout(paymentTimeout);
        request.abort()
            .then(function () {
                console.log('Payment timed out after 20 minutes.');
            })
            .catch(function () {
                console.log('Unable to abort, user is in the process of paying.');
            });
    }, 20 * 60 * 1000); /* 20 minutes */

    request.show()
        .then(function (instrument) {

            window.clearTimeout(paymentTimeout);
            processResponse(instrument); // Handle response from browser.
        })
        .catch(function (err) {
            console.log(err);
        });
}

/**
* Process the response from browser.
*
* @private
* @param {PaymentResponse} instrument The payment instrument that was authed.
*/
function processResponse(instrument) {
    var instrumentString = instrumentToJsonString(instrument);
    console.log(instrumentString);

    fetch('/buy', {
        method: 'POST',
        headers: new Headers({ 'Content-Type': 'application/json' }),
        body: instrumentString,
    })
        .then(function (buyResult) {
            if (buyResult.ok) {
                return buyResult.json();
            }
            console.log('Error sending instrument to server.');
        })
        .then(function (buyResultJson) {
            completePayment(instrument, buyResultJson.status, buyResultJson.message);

        })
        .catch(function (err) {
            console.log('Unable to process payment. ' + err);
        });
}

 
function completePayment(instrument, result, msg) {
    instrument.complete(result)
        .then(function () {
            console.log('Payment succeeds.');
            console.log(msg);
        })
        .catch(function (err) {
            console.log(err);
        });
}

/** Handle Google Pay not ready to pay case. */
function handleNotReadyToPay() {
    alert('Google Pay is not ready to pay.');
}


function paymentResponseToJsonString(paymentResponse) {
    // PaymentResponse is an interface, JSON.stringify works only on dictionaries.
    var paymentResponseDictionary = {
        methodName: paymentResponse.methodName,
        details: paymentResponse.details,
        shippingAddress: addressToJsonString(paymentResponse.shippingAddress),
        shippingOption: paymentResponse.shippingOption,
        payerName: paymentResponse.payerName,
        payerPhone: paymentResponse.payerPhone,
        payerEmail: paymentResponse.payerEmail,
    };
    return JSON.stringify(paymentResponseDictionary, undefined, 2);
}