/**
 * Created by Administrator on 2017/8/17.
 */

var dataArr=[
    {
        'title1':'保安员:',
        content1:[
            {
                title2:'招聘要求：',
                content2:[
                    '1.年龄：18岁-50岁',
                    '2.身体健康，无大面积纹身:',
                    '3.会说普通话，品行端正，无犯罪记录',
                    '4.服从管理，执行命令。'
                ]
            },
            {
                title2:'工资福利：',
                content2:[
                    '1.底薪2500元-3000元+出勤费+全勤奖+奖励+过节费(基本月工资在2500元-4500元)',
                    '2.年终奖（满一年以上员工）',
                    '3.带薪休假（满一年以上员工）',
                    '4.单人应聘入职报销路费（工作满六个月）',
                    '5.10人以上组团应聘入职报销路费（工作满三个月）',
                    '6.包食宿，提供服装被褥。',
                    '7.免费培训考取保安员上岗证',
                    '8.过节费100元-300元（工作满三个月）',
                    '9.每月评选一次表现优秀员工奖励50元',
                    '10.班长职务费+300元/月+话费补助100元/月',
                    '11.队长职务费+500元/月+话费补助100元/月',
                    '12.日工作6小时，最高8小时。'
                ]
            },
            {
                title2:'工作内容',
                content2:[
                    '1.大门岗：管理进出车辆人员,并做好检查登记。',
                    '2.形象岗：军姿站立，管理进出车辆人员，并做好检查登记。',
                    '3.警戒岗：防恐、防爆、防灾、防失窃。',
                    '4.巡逻岗：检查、预防各类安全隐患。',
                    '5.机动岗：机动备勤，处置各类突发事件。'
                ]
            }
        ]
    },
    {
        'title1':'特卫队员：',
        content1:[
            {
                title2:'招聘要求：',
                content2:[
                    '1.身高178以上',
                    '2.身体健康、无大面积纹身',
                    '3.无犯罪记录',
                    '4.服从管理，听从命令，绝对执行',
                    '5、身体素质过硬（退伍军人、体校生、武校生、有散打、搏击、跆拳道等基础人员优先录用）'
                ]
            },
            {
                title2:'工资待遇',
                content2:[
                    '1.底薪+出勤费+全勤+奖励3000元-6500元',
                    '2.包食宿、免费提供服装被褥。（西装自备）',
                    '3.实习期三个月按基本工资发放，临勤另算。',
                    '4.同样享受保安员所有福利待遇。',
                    '5.保安员队长由特卫队员中选拔。'
                ]
            }
        ]
    }
];
var dataArr2=[
    {
        title:'应聘注意事项',
        img:'images/danger.png',
        content:[
            '1.我公司不会收取任何费用',
            '2.我公司不会扣押身份证等一切证件和物品',
            '3.办理入职手续需要本人身份证原件及复印件（退伍军人需本人退伍证）',
            '4.需自备1寸白底彩色照片4张（办理保安员上岗证）',
            '5.需自备2寸彩色照片或电子版（办理入职手续）',
            '6.路费、车票须自行保存好，入职满三或六个月公司给予报销（只限单程普通列车车票、地铁发票、公交车发票）',
            '7.自备简历一份，或电子版。'
        ]
    },
    {
        title:'声明',
        img:'images/statement.png',
        content:[
            '1.我公司为正规合法保安服务公司，是由北京市工商总计注册成立，所有应聘人员我司承诺绝不收取任何费用及扣押任何证件和物品；',
            '2.所有入职员工，均将个人信息录入北京市公安局保安系统，如有违法记录人员将无法录入保安系统，我司将一律辞退。'

        ]
    }
];


$(function(){
    interview(dataArr);
    interview2(dataArr2);
});


//页面数据初始化；
function interview(arr1){
    var html1='';
    for(var i= 0,len=arr1.length;i<len;i++){
        html1+='<div  class="everyDetail">'+
                    '<div class="everyDetail-title"><img src="images/person.png"/>'+arr1[i].title1+'</div>';
        for(var j=0,len2=arr1[i].content1.length;j<len2;j++){
            html1+='<div class="everyDetail-content">'+
                '<div class="requirement-title">'+arr1[i].content1[j].title2+'</div>'+
                '<div class="requirement-content">';
            for(var k=0,len3=arr1[i].content1[j].content2.length;k<len3;k++){
                html1+='<p>'+arr1[i].content1[j].content2[k]+'</p>'
            }
        html1+= '</div>'+
                '</div>'

        }

        html1+= '</div>'

    }
    $('#everyDetail-box').html(html1);
}
function interview2(arr){
    var html='';
    for(var i=0,len=arr.length;i<len;i++){
        html+='<div class="attention-item">'+
                '<div class="attention-title"><img src="'+arr[i].img+'"/>'+arr[i].title+'</div>'+
                '<div class="attention-content">';
        for(var j=0,len2=arr[i].content.length;j<len2;j++){
            html+='<p>'+arr[i].content[j]+'</p>'
        }
    html+= '</div>'+
        '</div>'

    }
    $('.attention').html(html);
}

