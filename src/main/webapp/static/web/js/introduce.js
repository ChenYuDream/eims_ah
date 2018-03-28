/**
 * Created by Administrator on 2017/10/17.
 */

$(function(){
    resetTop();
});

//重置business-section-text的子元素垂直居中；
function  resetTop(){
    var outHeight = $('.text-intro li');
    calc(outHeight);
}

//计算每个business-section-text的子元素的top值；
function calc(outHeight){
    outHeight.each(function(i,val){
        var inHeight = $(this).children('div.introText');
        inHeight.css('marginTop',($(this).height()-inHeight.height())/2);
    })
}