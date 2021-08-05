$( document ).ready(function() {
    $("#createTopicSubmit").click(function () {
        $.ajax(
            {
                url: addTopicURL,
                data:{
                    visibility:$("#visibility").val(),
                    topicName :$("#topicName").val()

                },
                success:function (response) {
                    // console.log(response) ;
                    $( "#subs" ).load(location.href+" #subs>*","") ;
                }
            })
    });
});





