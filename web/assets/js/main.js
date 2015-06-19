/**
 * Created by Encode_X on 15/6/16.
 */
var xmlhttp;
function refresh_Content(url) {
    xmlhttp = new XMLHttpRequest();
    if (xmlhttp != null) {
        //console.log("事件发生");
        console.log(url);
        xmlhttp.onreadystatechange = state_Change;
        xmlhttp.open("GET", url, false);
        xmlhttp.setRequestHeader('Content-Type', 'application/x-javascript; charset=UTF-8');
        xmlhttp.send(null);
    }
}
function state_Change() {
    if (xmlhttp.readyState == 4) {// 4 = "loaded"
        if (xmlhttp.status == 200) {// 200 = "OK"
            document.getElementById('main-content').innerHTML = xmlhttp.responseText;
            refreshselect();
            refreshTimePicker();
        }
        else {
            alert("Problem retrieving data:" + xmlhttp.statusText);
        }
    }
}
function post_form(url,div_id) {
    //console.log("事件发生");
    $.ajax({
        cache: true,
        type: "POST",
        url: url,
        data: $(div_id).serialize(),// 你的formid
        async: false,
        error: function (request) {
            //alert("操作失败！");
        },
        success: function (data) {
            //alert("操作成功！");
            //console.log("success");
            $("#main-content").empty().append(data);
            refreshselect();
            refreshTimePicker();
        }
    });
}


///YXH///

var subcat = new Array();
var biglist = new Array('市科协', '理科学会', '工科学会', '农林学会', '医药学会', '交叉学科学会');
subcat[0] = new Array('0', '沈阳市科协', '沈阳市科协')
subcat[1] = new Array('0', '大连市科协', '大连市科协')
subcat[2] = new Array('0', '鞍山市科协', '鞍山市科协')
subcat[3] = new Array('0', '抚顺市科协', '抚顺市科协')
subcat[4] = new Array('0', '本溪市科协', '本溪市科协')
subcat[5] = new Array('0', '丹东市科协', '丹东市科协')
subcat[6] = new Array('0', '锦州市科协', '锦州市科协')
subcat[7] = new Array('0', '营口市科协', '营口市科协')
subcat[8] = new Array('0', '阜新市科协', '阜新市科协')
subcat[9] = new Array('0', '辽阳市科协', '辽阳市科协')
subcat[10] = new Array('0', '铁岭市科协', '铁岭市科协')
subcat[11] = new Array('0', '朝阳市科协', '朝阳市科协')
subcat[12] = new Array('0', '盘锦市科协', '盘锦市科协')
subcat[13] = new Array('0', '葫芦岛市科协', '葫芦岛市科协')
subcat[14] = new Array('1', '辽宁省物理学会', '辽宁省物理学会')
subcat[15] = new Array('1', '辽宁省力学学会', '辽宁省力学学会')
subcat[16] = new Array('1', '辽宁省气象学会', '辽宁省气象学会')
subcat[17] = new Array('1', '辽宁省地质学会', '辽宁省地质学会')
subcat[18] = new Array('1', '辽宁省地理学会', '辽宁省地理学会')
subcat[19] = new Array('1', '辽宁省海洋学会', '辽宁省海洋学会')
subcat[20] = new Array('1', '辽宁省地震学会', '辽宁省地震学会')
subcat[21] = new Array('1', '辽宁省动物学会', '辽宁省动物学会')
subcat[22] = new Array('1', '辽宁省昆虫学会', '辽宁省昆虫学会')
subcat[23] = new Array('1', '辽宁省生态学学会', '辽宁省生态学学会')
subcat[24] = new Array('1', '辽宁省微生物学会', '辽宁省微生物学会')
subcat[25] = new Array('1', '辽宁省环境科学学会', '辽宁省环境科学学会')
subcat[26] = new Array('1', '辽宁省野生动物保护协会', '辽宁省野生动物保护协会')
subcat[27] = new Array('1', '辽宁省地球物理学会', '辽宁省地球物理学会')
subcat[28] = new Array('1', '辽宁省生物技术协会', '辽宁省生物技术协会')
subcat[29] = new Array('1', '辽宁省数学会', '辽宁省数学会')
subcat[30] = new Array('2', '辽宁省机械工程学会', '辽宁省机械工程学会')
subcat[31] = new Array('2', '辽宁省电机工程学会', '辽宁省电机工程学会')
subcat[32] = new Array('2', '辽宁省电工技术学会', '辽宁省电工技术学会')
subcat[33] = new Array('2', '辽宁省水利学会', '辽宁省水利学会')
subcat[34] = new Array('2', '辽宁省复合材料学会', '辽宁省复合材料学会')
subcat[35] = new Array('2', '辽宁省制冷学会', '辽宁省制冷学会')
subcat[36] = new Array('2', '辽宁省自动化学会', '辽宁省自动化学会')
subcat[37] = new Array('2', '辽宁省计量测试学会', '辽宁省计量测试学会')
subcat[38] = new Array('2', '辽宁省标准化协会', '辽宁省标准化协会')
subcat[39] = new Array('2', '辽宁省图学学会', '辽宁省图学学会')
subcat[40] = new Array('2', '辽宁省计算机学会', '辽宁省计算机学会')
subcat[41] = new Array('2', '辽宁省通信学会', '辽宁省通信学会')
subcat[42] = new Array('2', '辽宁省测绘学会', '辽宁省测绘学会')
subcat[43] = new Array('2', '辽宁省造船工程学会', '辽宁省造船工程学会')
subcat[44] = new Array('2', '辽宁省航海学会', '辽宁省航海学会')
subcat[45] = new Array('2', '辽宁省铁道学会', '辽宁省铁道学会')
subcat[46] = new Array('2', '辽宁省公路学会', '辽宁省公路学会')
subcat[47] = new Array('2', '辽宁省航空宇航学会', '辽宁省航空宇航学会')
subcat[48] = new Array('2', '辽宁省兵工学会', '辽宁省兵工学会')
subcat[49] = new Array('2', '辽宁省金属学会', '辽宁省金属学会')
subcat[50] = new Array('2', '辽宁省有色金属学会', '辽宁省有色金属学会')
subcat[51] = new Array('2', '辽宁省腐蚀与防护学会', '辽宁省腐蚀与防护学会')
subcat[52] = new Array('2', '辽宁省核学会', '辽宁省核学会')
subcat[53] = new Array('2', '辽宁省石油石化学会', '辽宁省石油石化学会')
subcat[54] = new Array('2', '辽宁省可再生能源学会', '辽宁省可再生能源学会')
subcat[55] = new Array('2', '辽宁省土木建筑学会', '辽宁省土木建筑学会')
subcat[56] = new Array('2', '辽宁省纺织工程学会', '辽宁省纺织工程学会')
subcat[57] = new Array('2', '辽宁省印刷技术协会', '辽宁省印刷技术协会')
subcat[58] = new Array('2', '辽宁省仪器仪表学会', '辽宁省仪器仪表学会')
subcat[59] = new Array('2', '辽宁省地方供电设施管理学会', '辽宁省地方供电设施管理学会')
subcat[60] = new Array('2', '辽宁省烟草学会', '辽宁省烟草学会')
subcat[61] = new Array('2', '辽宁省振动工程学会', '辽宁省振动工程学会')
subcat[62] = new Array('2', '辽宁省颗粒学会', '辽宁省颗粒学会')
subcat[63] = new Array('2', '辽宁省消防协会', '辽宁省消防协会')
subcat[64] = new Array('2', '辽宁省人工智能学会', '辽宁省人工智能学会')
subcat[65] = new Array('2', '辽宁省质量协会', '辽宁省质量协会')
subcat[66] = new Array('2', '辽宁省人民防空学会', '辽宁省人民防空学会')
subcat[67] = new Array('2', '辽宁省包装联合会', '辽宁省包装联合会')
subcat[68] = new Array('2', '辽宁省互联网协会', '辽宁省互联网协会')
subcat[69] = new Array('2', '辽宁省分析测试协会', '辽宁省分析测试协会')
subcat[70] = new Array('2', '辽宁省化工学会', '辽宁省化工学会')
subcat[71] = new Array('3', '辽宁省农学会', '辽宁省农学会')
subcat[72] = new Array('3', '辽宁省林学会', '辽宁省林学会')
subcat[73] = new Array('3', '辽宁省土壤学会', '辽宁省土壤学会')
subcat[74] = new Array('3', '辽宁省水产学会', '辽宁省水产学会')
subcat[75] = new Array('3', '辽宁省畜牧兽医学会', '辽宁省畜牧兽医学会')
subcat[76] = new Array('3', '辽宁省水土保持学会', '辽宁省水土保持学会')
subcat[77] = new Array('3', '辽宁省农业经济学会', '辽宁省农业经济学会')
subcat[78] = new Array('3', '辽宁省土地学会', '辽宁省土地学会')
subcat[79] = new Array('3', '辽宁省食品科学技术学会', '辽宁省食品科学技术学会')
subcat[80] = new Array('3', '辽宁省花卉协会', '辽宁省花卉协会')
subcat[81] = new Array('3', '辽宁省园艺学会', '辽宁省园艺学会')
subcat[82] = new Array('3', '辽宁省食品质量与安全学会', '辽宁省食品质量与安全学会')
subcat[83] = new Array('3', '辽宁省植物保护学会', '辽宁省植物保护学会')
subcat[84] = new Array('3', '辽宁省作物学会', '辽宁省作物学会')
subcat[85] = new Array('4', '辽宁省糖尿病医学营养防治学会', '辽宁省糖尿病医学营养防治学会')
subcat[86] = new Array('4', '辽宁省中医药学会', '辽宁省中医药学会')
subcat[87] = new Array('4', '辽宁省药学会', '辽宁省药学会')
subcat[88] = new Array('4', '辽宁省护理学会', '辽宁省护理学会')
subcat[89] = new Array('4', '辽宁省营养学会', '辽宁省营养学会')
subcat[90] = new Array('4', '辽宁省针灸学会', '辽宁省针灸学会')
subcat[91] = new Array('4', '辽宁省防痨协会', '辽宁省防痨协会')
subcat[92] = new Array('4', '辽宁省心理卫生协会', '辽宁省心理卫生协会')
subcat[93] = new Array('4', '辽宁省抗癌协会', '辽宁省抗癌协会')
subcat[94] = new Array('4', '辽宁省抗癌协会', '辽宁省抗癌协会')
subcat[95] = new Array('4', '辽宁省康复医学会', '辽宁省康复医学会')
subcat[96] = new Array('4', '辽宁省预防医学会', '辽宁省预防医学会')
subcat[97] = new Array('4', '辽宁省法医学会', '辽宁省法医学会')
subcat[98] = new Array('4', '辽宁省中西医结合学会', '辽宁省中西医结合学会')
subcat[99] = new Array('4', '辽宁省生命科学学会', '辽宁省生命科学学会')
subcat[100] = new Array('4', '辽宁省医学影像学会', '辽宁省医学影像学会')
subcat[101] = new Array('4', '辽宁省性病艾滋病防治协会', '辽宁省性病艾滋病防治协会')
subcat[102] = new Array('4', '辽宁省按摩协会', '辽宁省按摩协会')
subcat[103] = new Array('4', '辽宁省蒙医药学会', '辽宁省蒙医药学会')
subcat[104] = new Array('4', '辽宁省职工疗养学会', '辽宁省职工疗养学会')
subcat[105] = new Array('4', '辽宁省细胞生物学学会', '辽宁省细胞生物学学会')
subcat[106] = new Array('4', '辽宁省超声医学工程学会', '辽宁省超声医学工程学会')
subcat[107] = new Array('4', '辽宁省亚健康学会', '辽宁省亚健康学会')
subcat[108] = new Array('4', '辽宁省手法诊疗研究会', '辽宁省手法诊疗研究会')
subcat[109] = new Array('5', '辽宁省青少年科技辅导员协会', '辽宁省青少年科技辅导员协会')
subcat[110] = new Array('5', '辽宁省区域协调发展研究会', '辽宁省区域协调发展研究会')
subcat[111] = new Array('5', '辽宁省卫生法学会', '辽宁省卫生法学会')
subcat[112] = new Array('5', '辽宁省科学技术情报学会', '辽宁省科学技术情报学会')
subcat[113] = new Array('5', '辽宁省图书馆学会', '辽宁省图书馆学会')
subcat[114] = new Array('5', '辽宁省科普作家协会', '辽宁省科普作家协会')
subcat[115] = new Array('5', '辽宁省档案学会', '辽宁省档案学会')
subcat[116] = new Array('5', '辽宁省老科技工作者协会', '辽宁省老科技工作者协会')
subcat[117] = new Array('5', '辽宁省中直企事业会计学会', '辽宁省中直企事业会计学会')
subcat[118] = new Array('5', '辽宁省会计学会', '辽宁省会计学会')
subcat[119] = new Array('5', '辽宁省民族科普协会', '辽宁省民族科普协会')
subcat[120] = new Array('5', '辽宁省人才研究会', '辽宁省人才研究会')
subcat[121] = new Array('5', '辽宁省继续工程教育协会', '辽宁省继续工程教育协会')
subcat[122] = new Array('5', '辽宁省技术经济研究会', '辽宁省技术经济研究会')
subcat[123] = new Array('5', '辽宁省珠算心算协会', '辽宁省珠算心算协会')
subcat[124] = new Array('5', '辽宁省发明协会', '辽宁省发明协会')
subcat[125] = new Array('5', '辽宁省管理科学研究会', '辽宁省管理科学研究会')
subcat[126] = new Array('5', '辽宁省策划学会', '辽宁省策划学会')
subcat[127] = new Array('5', '辽宁省营养师协会', '辽宁省营养师协会')
subcat[128] = new Array('5', '辽宁省理财规划师协会', '辽宁省理财规划师协会')
subcat[129] = new Array('5', '辽宁省可持续发展促进会', '辽宁省可持续发展促进会')
subcat[130] = new Array('5', '辽宁省科技新闻学会', '辽宁省科技新闻学会')
subcat[131] = new Array('5', '辽宁省心理咨询师协会', '辽宁省心理咨询师协会')
subcat[132] = new Array('5', '辽宁省认知科学学会', '辽宁省认知科学学会')
subcat[133] = new Array('5', '辽宁省社会组织发展促进会', '辽宁省社会组织发展促进会')
subcat[134] = new Array('5', '辽宁省传播与科技研究会', '辽宁省传播与科技研究会')
subcat[135] = new Array('5', '辽宁省老干部摄影协会', '辽宁省老干部摄影协会')
subcat[136] = new Array('5', '辽宁省科技创新与人才培养研究会', '辽宁省科技创新与人才培养研究会')
subcat[137] = new Array('5', '辽宁省民营科技企业家协会', '辽宁省民营科技企业家协会')
subcat[138] = new Array('5', '辽宁省农村专业技术协会', '辽宁省农村专业技术协会')
subcat[139] = new Array('5', '辽宁省科学发展研究会', '辽宁省科学发展研究会')




function changeselect1(locationid) {
    for (j = 0; j < biglist.length; j++) {
        if (biglist[j] == locationid) {
            locationid = j;
        }
    }
    document.submit_form.unitName.length = 0;//初始化下拉列表，清空下拉数据
    document.submit_form.unitName.options[0] = new Option('所有小类', '所有小类');//给第一个值
    for (i = 0; i < subcat.length; i++) {
        if (subcat[i][0] == locationid) {
            document.submit_form.unitName.options[document.submit_form.unitName.length] = new Option(subcat[i][1], subcat[i][2]);
        }//建立option
    }
}

////////////////
function refreshselect() {
    // 使用默认参数
    $("select").selected();

    // 设置参数
    $("select").selected({
        btnWidth: '300px',
        btnSize: 'sm',
        btnStyle: 'primary',
        maxHeight: '100px'
    });
}

$(function() {
    refreshselect();
})(jQuery);

//////Time Picker
function refreshTimePicker(){
    var $testTimePicker = $('#proposerOpenTime');
    if($testTimePicker==null){
        return;
    }
    $testTimePicker.datetimepicker({
        format: 'yyyy-mm-dd hh:ii',
        autoclose: true,
        todayBtn: true
    }).on('changeDate', function(ev){
        // 使用 getTime() 函数来获取更改后的时间（格式为时间戳数）
        console.log(ev.date.getTime());
    });

    $('#proposerCloseTime').datetimepicker({
        format: 'yyyy-mm-dd hh:ii',
        autoclose: true,
        todayBtn: true
    }).on('changeDate', function(ev){
        console.log(ev.date.getTime());
    });

    $('#resUnitsOpenTime').datetimepicker({
        format: 'yyyy-mm-dd hh:ii',
        autoclose: true,
        todayBtn: true
    }).on('changeDate', function(ev){
        console.log(ev.date.getTime());
    });

    $('#resUnitsCloseTime').datetimepicker({
        format: 'yyyy-mm-dd hh:ii',
        autoclose: true,
        todayBtn: true
    }).on('changeDate', function(ev){
        console.log(ev.date.getTime());
    });

    $('#expertOpenTime').datetimepicker({
        format: 'yyyy-mm-dd hh:ii',
        autoclose: true,
        todayBtn: true
    }).on('changeDate', function(ev){
        console.log(ev.date.getTime());
    });

    $('#expertCloseTime').datetimepicker({
        format: 'yyyy-mm-dd hh:ii',
        autoclose: true,
        todayBtn: true
    }).on('changeDate', function(ev){
        console.log(ev.date.getTime());
    });

    showTip();
}

function showTip(){
    var $modal = $('#my-alert');
    $modal.modal('open');
}