$(document).ready(function () {
    $('#unifyPageNAV').load('webapp/unify/systemuser/masterpage/PageNavigation.jsp');
    $('#unifyFooter').load('webapp/unify/systemuser/masterpage/PageFooter.jsp');
    
    $('#jobLikeTable').DataTable({ 
        "responsive": true, 
        "pageLength": 4, 
        "bFilter": false,
        "bLengthChange": false
    });
});

