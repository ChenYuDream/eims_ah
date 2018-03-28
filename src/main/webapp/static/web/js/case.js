/**
 * Created by Administrator on 2017/8/15.
 */


var caseSlider = {
    $slider: null,
    $detail: null,
    WD: 566,
    LWidth: 34,//----------------------------这是刚加的居中--------------------------------------------
    DURATION: 500,//动画过度的时间
    WAIT: 3000,//等待的时间
    fileServerPath: '',
    $ulImgs: null,//
    $ulIdxs: null,//
    moved: 0,//已经移动过去的图片的个数
    init: function (imgs) {
        this.$ulImgs = $('.case-slider-imgs');
        this.$ulIdxs = $('.case-slider-index');
        this.$slider = $('.case-section-slider');
        this.$detail = $('.case-detail');
        this.interView(imgs);//页面初始化；
        this.$detail.children(':first').addClass('liSel');
        this.$slider.hover(function () {
            $(this).children('img').css('display', 'block');
        }, function () {
            $(this).children('img').css('display', 'none');
        });
        this.$ulIdxs.on('mouseover', 'li', function (ev) {
            var e = ev || window.event;
            e.target = e.target || e.srcElement;
            var $sta = $(e.target);//当前选中的元素
            if (!$sta.is('.select')) {
                var endi = $sta.index('.case-slider-index>li');//当前选中的元素的下标
                var starti = $('.select').index('.case-slider-index>li');//原来select的下标
                this.moved += endi - starti;
                this.$ulImgs.stop(true).animate({left: -this.moved * this.WD}, this.DURATION);
                this.changeSel();//切换选中图标；

            }
        }.bind(this));
        this.$slider.on('click', '.caseLeft', function () {
            var max = this.$ulImgs.children('li').length - 1;//可以移动的最大个数
            if (this.moved >= max) {
                return false;
            } else {
                this.moved++;
                this.$ulImgs.stop(true).animate({left: -this.moved * this.WD}, this.DURATION);
                this.changeSel();
            }
        }.bind(this));
        this.$slider.on('click', '.caseRight', function () {
            if (this.moved <= 0) {
                return false;
            } else {
                this.moved--;
                this.$ulImgs.stop(true).animate({left: -this.moved * this.WD}, this.DURATION);
                this.changeSel();
            }
        }.bind(this))
    },
    changeSel: function () {
        this.$ulIdxs.children().eq(this.moved).addClass('select')
            .siblings().removeClass('select');
    },
    interView: function (arrImg) {
        for (var i = 0, htmlImgs = '', htmlIdxs = '', len = arrImg.length; i < len; i++) {
            htmlImgs += '<li><img src="' + this.fileServerPath + arrImg[i] + '"/></li>';
            htmlIdxs += '<li></li>';
        }
        this.$ulImgs.html(htmlImgs)
            .css({
                width: len * this.WD,
                left: 0
            });
        this.$ulIdxs.html(htmlIdxs)
            .children(':first').addClass('select');
        var MLeft = (this.WD - this.LWidth * (arrImg.length)) / 2;//----------------------------这是刚加的居中--------------------------------------------
        this.$ulIdxs.css({       //----------------------------这是刚加的居中--------------------------------------------
            marginLeft: MLeft
        });
        this.moved = 0;
    }
};
