$(function () {

    var chart_consult = echarts.init(document.getElementById("chart_consult"));


    var chart_recruit = echarts.init(document.getElementById("chart_recruit"));
    var baroption = {
        title: {
            text: '2016年计划咨询量和实际'
        },
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data: ['预计量', '实际量']
        },
        grid: {
            x: 30,
            x2: 40,
            y2: 24
        },
        calculable: true,
        xAxis: [
            {
                type: 'category',
                data: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月']
            }
        ],
        yAxis: [
            {
                type: 'value'
            }
        ],
        series: [
            {
                name: '预计量',
                type: 'bar',
                data: [14.0, 14.9, 27.0, 33.2, 35.6, 76.7, 52.6, 62.2, 32.6, 40.0, 30.4, 40.3],
                markLine: {
                    data: [
                        {type: 'average', name: '平均值'}
                    ]
                }
            },
            {
                name: '实际量',
                type: 'bar',
                data: [2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 48.6, 53.2, 48.7, 18.8, 6.0, 2.3],
                markLine: {
                    data: [
                        {type: 'average', name: '平均值'}
                    ]
                },
                itemStyle: {
                    normal: {
                        label: {
                            show: true,//是否展示
                            textStyle: {
                                fontWeight: 'bolder',
                                fontSize: '10'
                            }
                        }
                    }
                }
            }
        ]
    };
    chart_consult.setOption(baroption);
    chart_recruit.setOption(baroption);

    window.onresize = chart_consult.resize;
    window.onresize = chart_recruit.resize;
});
