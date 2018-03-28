/**
 * Created by Administrator on 2017/8/13.
 */

$(window).resize(function () {
    wd = $(window).width();
    slider.inteView();
});
var wd = $(window).width();

var slider = {
    LIWIDTH: wd,//li的宽度
    DURATION: 500,//动画过度的时间
    WAIT: 3000,//等待的时间
    $ulImgs: null,//得到id位imgs的ul
    $ulIdxs: null,//得到id为indexs的ul
    $divText: null,//得到class为slider_text的div，图片上的文字
    moved: 0,//已经移动过去的图片的个数
    state: true,
    init: function () {
        var that = this;//保存this；
        that.$ulImgs = $("#imgs");
        that.$ulIdxs = $(".index");
        that.$divText = $(".slider_text");
        that.inteView();//初始化页面；
        that.autoMove();//滚动图片
        //鼠标悬停停止播放
        $(".slider").hover(function () {
            //if(!that.state){
            //    return;
            //}
            that.$ulImgs.stop(true);
        }, function () {
            that.moved = $(".hover").index(".index>li");
            that.autoMove();
        });
        //给#imgs添加事件监听
        that.$ulImgs.on("mouseover", "li>img", function (ev) {
            //if(!that.state){
            //    return;
            //}
            var e = ev || window.event;
            e.target = e.target || e.srcElement;
            var $sta = $(e.target);
            var i = $sta.index("#imgs img");
            that.moved = i;
            that.moved >= imgs.length && (that.moved = 0);
            that.$ulImgs.css("left", -that.moved * that.LIWIDTH);
            that.changeHover();
        });
        //给#indexs添加事件监听
        that.$ulIdxs.on("mouseover", "li", function (ev) {
            //that.state=false;
            var e = ev || window.event;
            e.target = e.target || e.srcElement;
            var $sta = $(e.target);
            if (!$sta.is(".hover")) {
                var endi = $sta.index(".index>li");
                var starti = $(".hover").index(".index>li");
                //修改moved为endi-starti
                that.moved += (endi - starti);

                that.$ulImgs.css({left: -that.moved * that.LIWIDTH});
                that.changeHover();
            }
        });
    },

    autoMove: function () {
        var that = this;
        that.moved++;
        that.$ulImgs.stop(true).animate({'null': 1}, that.WAIT, function () {
            that.$ulImgs.stop(true).animate({left: -that.moved * that.LIWIDTH}, that.DURATION, function () {
                if (that.moved >= imgs.length) {
                    that.moved = 0;
                    that.$ulImgs.css('left', 0);
                }
                that.changeHover();
                that.autoMove();
            })
        })
    },
    changeHover: function () {
        this.$ulIdxs.children().eq(this.moved).addClass("hover")
            .siblings().removeClass("hover");
    },
    inteView: function () {
        var that = this;
        that.moved = 0;
        that.LIWIDTH = wd;
        //that.state = true;
        for (var i = 0, htmlImgs = '', htmlIdx = '', len = imgs.length; i < len; i++) {
            htmlImgs += '<li><img width="1920" height="559" style="width:' + wd + 'px;" src="' + imgs[i].img + '"/></li>';
            htmlIdx += '<li></li>';
        }
        that.$ulImgs.html(htmlImgs)
            .css({
                width: (imgs.length + 1) * that.LIWIDTH,
                left: 0
            });
        that.$ulImgs.append(that.$ulImgs.children(":first").clone());

        that.$ulIdxs.html(htmlIdx)
            .children(":first").addClass("hover");
        $('.slider').css({
            height: wd / 1920 * 559
        })
    }
};
slider.init();

var caseSlide = {
    speed: 1000 / 60,
    $slide: null,
    $slideli1: null,
    $slideli2: null,
    timer: null,
    init: function () {
        var that = this;
        that.$slide = $('.slide');
        that.$slideli1 = $('.slideli1');
        that.$slideli2 = $('.slideli2');
        that.$slideli2.html(that.$slideli1.html());//初始化页面；
        that.timer = setInterval(that.Marquee.bind(that), that.speed);
        that.$slide.hover(function () {
            //鼠标移动DIV上停止
            clearInterval(that.timer);
            that.timer = null;
        }, function () {
            //离开继续调用
            that.timer = setInterval(that.Marquee.bind(that), that.speed);
        });
    },

    Marquee: function () {
        if (this.$slide.scrollLeft() >= this.$slideli1.width())
            this.$slide.scrollLeft(0);
        else {
            this.$slide.scrollLeft(this.$slide.scrollLeft() + 1);
        }
    }
};
caseSlide.init();