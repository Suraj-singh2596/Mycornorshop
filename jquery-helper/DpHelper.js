
function CheckDpExistence(current) {
    var Mobile = current.attr('mobile');
    var Url = link + '/Services.aspx/CheckDpExistence';
    var Data = JSON.stringify({ Mobile: Mobile });
    var Result = doAjax(Url, Data);
    if (Result != '') {

    }
}