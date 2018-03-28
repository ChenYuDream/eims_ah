<!--多文件上传公共类-->
<script>
    var fileServerPath = '${baseInfo.fileServerPath}';
    var multiImg = {
        imgDom: 'demo2',
        initList: function (bannerUrlArr, bannerUrlStr) {
            if (bannerUrlStr != '') {
                var br = jsonUtil.parseJson(bannerUrlStr);
                console.log(br);
                if (br.length > 0) {
                    for (var i = 0; i < br.length; i++) {
                        this.appendImg(bannerUrlArr, br[i]);
                    }
                }
            }
        },
        appendImg: function (bannerUrlArr, fileUrl) {
            bannerUrlArr.push(fileUrl);
            console.log(fileUrl);
            $('#' + this.imgDom).append('<img src="' + fileServerPath + "/" + fileUrl + '"  height="100" style="margin-right: 10px;margin-top: 10px" class="layui-upload-img">')
        },
        removeAll: function (bannerUrlArr) {
            bannerUrlArr.splice(0, bannerUrlArr.length);
            $('#' + this.imgDom).find("img").remove();
        }
    }
    var multiImg2 = $.extend({}, multiImg);
    //多图片上传

</script>
