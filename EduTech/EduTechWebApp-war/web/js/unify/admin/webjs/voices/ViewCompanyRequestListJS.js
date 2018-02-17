var rowItemName;
function addCompany() {
    var posterID = document.getElementById("posterID").innerHTML;
    var requestCompany = document.getElementById("company").innerHTML;
    var requestIndustry = document.getElementById("industry").innerHTML;
    $('iframe').attr('src', 'VoicesAdmin?pageTransit=goToAddCompany&requestPosterID=' + posterID + '&requestCompany=' + requestCompany + '&requestIndustry=' + requestIndustry);
    $('#newCompany-iframe').iziModal('open', event);
}
$(document).ready(function() {

    $('#datatable-responsive tbody').on('click', 'tr', function(event) {
        var $cell= $(event.target).closest('td');
        if($cell.index() > 0 && $cell.index() < 4) {
            var rowData = $(this).children("td").map(function() {
                return $(this).text();
            }).get();
            rowRequestPosterID = $.trim(rowData[1]);
            rowRequestCompany = $.trim(rowData[2]);
            $('iframe').attr('src', 'VoicesAdmin?pageTransit=goToViewCompanyRequestListDetails&requestPosterID=' + rowRequestPosterID + '&requestCompany=' + rowRequestCompany);
            $('#modal-iframe').iziModal('open', event);
        }
        
    });
    
    $("#modal-iframe").iziModal({
        title: 'Request Details',
        iconClass: 'fa fa-cubes',
        transitionIn: 'transitionIn',
        transitionOut: 'transitionOut',
        headerColor: '#337AB7',
        width: 500,
        overlayClose: true,
        iframe : true,
        iframeHeight: 325
    });
    
    $('#newCompany-iframe').iziModal({
        title: 'New Company',
        subtitle: 'Fill in the information of the new company here',
        iconClass: 'fa fa-cubes',
        transitionIn: 'transitionIn',
        transitionOut: 'transitionOut',
        headerColor: '#337AB7',
        width: 525,
        overlayClose: true,
        iframe : true,
        iframeHeight: 325
    });
    
    $('#closeSuccess').click(function() { $('#successPanel').fadeOut(300); });
    $('#closeError').click(function() { $('#errorPanel').fadeOut(300); });
});