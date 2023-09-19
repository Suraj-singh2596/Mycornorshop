$(function () {

    var token = null;
    var config = {
        apiKey: "AIzaSyA62c2j2HZdm7G8D_NZG-WqtFrPigKSIgo",
        authDomain: "mycornershop-5505.firebaseapp.com",
        databaseURL: "https://mycornershop-5505.firebaseio.com",
        projectId: "mycornershop-5505",
        storageBucket: "mycornershop-5505.appspot.com",
        messagingSenderId: "825294360196",
        appId: "1:825294360196:web:6d4217e156b4b0a53a7cd1",
        measurementId: "G-L4WY4DTLZK"
    };
    firebase.initializeApp(config);

    const messaging = firebase.messaging();

    messaging.requestPermission()
        .then(function () {
            console.log("granted");
            if (isTokenSentToServer()) {
                console.log("already granted");
            } else {
                getRegtoken();
            }
        });


    function getRegtoken() {
        messaging.getToken().then((currentToken) => {
            if (currentToken) {
                console.log("Token");
                console.log(currentToken);
                setTokenSentToServer(true);
                saveToken(currentToken)
                //updateUIForPushEnabled(currentToken);
            } else {
                console.log('No Instance ID token available. Request permission to generate one.');
                setTokenSentToServer(false);
            }
        }).catch((err) => {
            console.log('An error occurred while retrieving token. ', err);
            setTokenSentToServer(false);
        });

    }
    function setTokenSentToServer(sent) {
        window.localStorage.setItem('sentToServer', sent ? 1 : 0);
    }
    function isTokenSentToServer() {
        return window.localStorage.getItem('sentToServer') === '1';
    }
    messaging.onMessage(function (payload) {
        console.log('Message received. ', payload);

        notificationTitle = payload.notification.title;
        notificationOptions = {
            body: payload.notification.body,
            icon: payload.notification.icon
        };

        var notification = new Notification(notificationTitle, notificationOptions);

    });

});
function saveToken(currentToken) {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "Home.aspx/fnUpdateDeviceID",
        data: '{currentToken: "' + currentToken + '"}',
        beforeSend: function () {
            $("#preload").show();
        },
        dataType: "json",
        success: function (data) {
        },
        complete: function () {
            $("#preload").hide();
        }
    });
}