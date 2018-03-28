/**
 * Created by Administrator on 2017/8/15.
 */
$(function(){
    advantageSlider.init();
});
var advantageSlider={
    speed: 1000/60,
    $slider:null,
    $slideli1:null,
    $slideli2:null,
    timer:null,
    init:function(){
        this.$slider=$('.advantage-slider');
        this.$slideli1=$('.advantage-slideli1');
        this.$slideli2=$('.advantage-slideli2');
        this.$slideli2.html(this.$slideli1.html());
        this.timer=setInterval(this.move.bind(this),this.speed);
        this.$slider.hover(function(){
            clearInterval(this.timer);
            this.timer=null;
        }.bind(this),function(){
            this.timer=setInterval(this.move.bind(this),this.speed);
        }.bind(this))
    },
    move:function(){
        if(this.$slider.scrollLeft()>=this.$slideli1.width()){
            this.$slider.scrollLeft(0);
        }else{
            this.$slider.scrollLeft(this.$slider.scrollLeft()+1);
        }
    }
};

