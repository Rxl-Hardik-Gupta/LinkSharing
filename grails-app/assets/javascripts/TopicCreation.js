// $( document ).ready(function() {
//
// });
$("#createTopicSubmit").click(function () {
    $.ajax(
        {
            type: 'GET',
            url: addTopicURL,
            data:{
                visibility:$("#visibility").val(),
                topicName :$("#topicName").val()

            },
            success:function () {

                location.reload();

            },
            error: function () {
                alert("Failed") ;
            }
        } )
});


function unsubscribe( id) {
    $.ajax({

        type:'GET',
        url:'http://localhost:4001/dashboard/unsubscribe',
        data:{subId:id},
        success: function() {
            location.reload() ;
        },
        error:function() {
            alert("Failed") ;
        }

    })
}
function deleteTopic( id) {
    $.ajax({

        type:'GET',
        url:'http://localhost:4001/topic/deleteTopic',
        data:{topicId:id},
        success: function() {
            location.reload() ;
        },
        error:function() {
            alert("Topic Could Not be Deleted") ;
        }

    })
}
function changeSeriousness(id, newValue) {
    $.ajax({

        type:'GET',
        url:'http://localhost:4001/subscription/changeSeriousness',
        data:{
            subId:id,
            newSeriousness: newValue

        },
        success: function() {
            location.reload() ;
        },
        error:function(e) {
            alert(e) ;
        }

    })
}

function changeVisibility(topicId, newVisibility) {
    $.ajax({

        type:'GET',
        url:'http://localhost:4001/topic/changeVisibility',
        data:{
            topicId:topicId,
            newVisibility: newVisibility

        },
        success: function() {
            location.reload() ;
        },
        error:function(e) {
            alert(e.toString()) ;
        }

    })
}

function unsubscribeTopic( id) {
    $.ajax({

        type:'GET',
        url:'http://localhost:4001/topic/unsubscribeTopic',
        data:{
            topicId:id

        },
        success: function() {
            location.reload() ;
        },
        error:function(e) {
            alert("Alert OF error") ;
        }

    })
}
function subscribeTopic( id) {
    $.ajax({

        type:'GET',
        url:'http://localhost:4001/topic/subscribe',
        data:{
            topicId:id

        },
        success: function() {
            location.reload() ;
        },
        error:function(e) {
            alert("Alert OF error") ;
        }

    })
}

function markAsRead(id) {
    $.ajax({

        type:'GET',
        url:'http://localhost:4001/resource/markAsRead',
        data:{
            readingItem:id

        },
        success: function() {
            location.reload() ;
        },
        error:function(e) {
            alert("Alert OF error") ;
        }

    })
}


var $star_rating = $('.star-rating .fa');


var SetRatingStar = function() {
    var ratingValue = parseInt($star_rating.siblings('input.rating-value').val()) ;

    return $star_rating.each(function() {
        if (parseInt($star_rating.siblings('input.rating-value').val()) >= parseInt($(this).data('rating'))) {
            return $(this).removeClass('fa-star-o').addClass('fa-star');
        } else {
            return $(this).removeClass('fa-star').addClass('fa-star-o');
        }
    });
};

$star_rating.on('click', function() {
    $star_rating.siblings('input.rating-value').val($(this).data('rating'));
    return SetRatingStar();
});

SetRatingStar();


// function changeRating(id, ) {
//     $.ajax({
//
//         type:'GET',
//         url:'http://localhost:4001/resource/markAsRead',
//         data:{
//             readingItem:id
//
//         },
//         success: function() {
//             location.reload() ;
//         },
//         error:function(e) {
//             alert("Alert OF error") ;
//         }
//
//     })
// }





