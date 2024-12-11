function show_report() {
  $('#report_image_container').modal('show')
}

function show_processed() {
  $('#processed_container').modal('show')
}

function GACP_search() {
  var GACP_selected = $("#GACP_record").find(":selected").val();
  var search_url = "/api/trace/gacp" + location.search + "&table=" + GACP_selected;
  var search_columns = []
  switch (GACP_selected) {
    case "seedling":
      search_columns = [
        {
          sortable: true,
          field: 'cultivar_code',
          title: '栽培作物'
        },
        {
          sortable: true,
          field: 'item_no',
          title: '品種'
        },
        {
          sortable: true,
          field: 'seed_qty',
          title: '數量'
        },
        {
          sortable: true,
          field: 'seed_source',
          title: '種苗來源'
        },
        {
          sortable: true,
          field: 'purch_date',
          title: '購入日期'
        },
      ]
      break;
    case "cultivate":
      search_columns = [
        {
          sortable: true,
          field: 'record_item',
          title: '作業內容'
        },
        {
          sortable: true,
          field: 'word_date',
          title: '作業日期'
        },
        {
          sortable: true,
          field: 'memo',
          title: '備註'
        },
      ]
      break;
    case "fert":
      search_columns = [
        {
          sortable: true,
          field: 'record_item',
          title: '施肥別'
        },
        {
          sortable: true,
          field: 'word_date',
          title: '施用日期'
        },
        {
          sortable: true,
          field: 'item_no',
          title: '施用資材'
        },
        {
          sortable: true,
          field: 'application_qty',
          title: '施用量'
        },
        {
          sortable: true,
          field: 'memo',
          title: '備註'
        }
      ]
      break;
    case "pest":
      search_columns = [
        {
          sortable: true,
          field: 'record_item',
          title: '防治對象'
        },
        {
          sortable: true,
          field: 'word_date',
          title: '施用日期'
        },
        {
          sortable: true,
          field: 'item_no',
          title: '施用資材'
        },
        {
          sortable: true,
          field: 'application_qty',
          title: '施用量'
        },
        {
          sortable: true,
          field: 'dilution_ratio',
          title: '稀釋倍數'
        },
        {
          sortable: true,
          field: 'preve_method',
          title: '備註'
        }
      ]
      break;
    case "harvest":
      search_columns = [
        {
          sortable: true,
          field: 'word_date',
          title: '作業日期'
        },
        {
          sortable: true,
          field: 'harvest_qty',
          title: '處理重量'
        },
        {
          sortable: true,
          field: 'grading_code',
          title: '分級'
        },
        {
          sortable: true,
          field: 'storage_code',
          title: '貯藏方式'
        },
        {
          sortable: true,
          field: 'word_memo',
          title: '作業內容'
        },
        {
          sortable: true,
          field: 'memo',
          title: '備註'
        }
      ]
      break;
    case "fert_purchase":
      search_columns = [
        {
          sortable: true,
          field: 'purch_date',
          title: '採購日期'
        },
        {
          sortable: true,
          field: 'material_code',
          title: '資材(廠牌)'
        },
        {
          sortable: true,
          field: 'label',
          title: '廠商(製造商/代理商)'
        },
        {
          sortable: true,
          field: 'price',
          title: '價格(每單位)'
        },
        {
          sortable: true,
          field: 'qty',
          title: '數量'
        },
        {
          sortable: true,
          field: 'subtotal',
          title: '總價'
        },
        {
          sortable: true,
          field: 'up_file',
          title: '購買單據'
        },
        {
          sortable: true,
          field: 'memo',
          title: '備註'
        }
      ]
      break;
    case "prevention_purchase":
      search_columns = [
        {
          sortable: true,
          field: 'purch_date',
          title: '採購日期'
        },
        {
          sortable: true,
          field: 'material_code',
          title: '資材(廠牌)'
        },
        {
          sortable: true,
          field: 'label',
          title: '廠商(製造商/代理商)'
        },
        {
          sortable: true,
          field: 'price',
          title: '價格(每單位)'
        },
        {
          sortable: true,
          field: 'qty',
          title: '數量'
        },
        {
          sortable: true,
          field: 'subtotal',
          title: '總價'
        },
        {
          sortable: true,
          field: 'up_file',
          title: '購買單據'
        },
        {
          sortable: true,
          field: 'memo',
          title: '備註'
        }
      ]
      break;
    case "other_purchase":
      search_columns = [
        {
          sortable: true,
          field: 'purch_date',
          title: '採購日期'
        },
        {
          sortable: true,
          field: 'material_code',
          title: '資材(廠牌)'
        },
        {
          sortable: true,
          field: 'label',
          title: '廠商(製造商/代理商)'
        },
        {
          sortable: true,
          field: 'price',
          title: '價格(每單位)'
        },
        {
          sortable: true,
          field: 'qty',
          title: '數量'
        },
        {
          sortable: true,
          field: 'subtotal',
          title: '總價'
        },
        {
          sortable: true,
          field: 'up_file',
          title: '購買單據'
        },
        {
          sortable: true,
          field: 'memo',
          title: '備註'
        }
      ]
      break;
    case "analysis":
      search_columns = [
        {
          sortable: true,
          field: 'up_date',
          title: '日期'
        },
        {
          sortable: true,
          field: 'up_file',
          title: '圖片'
        },
        {
          sortable: true,
          field: 'memo',
          title: '備註'
        }
      ]
      break;
    case "other":
      search_columns = [
        {
          sortable: true,
          field: 'other_date',
          title: '日期'
        },
        {
          sortable: true,
          field: 'memo',
          title: '記事'
        }
      ]
      break;
    case "sale":
      search_columns = [
        {
          sortable: true,
          field: 'harvest_no',
          title: '原料採收日期'
        },
        {
          sortable: true,
          field: 'sales_date',
          title: '出貨日期'
        },
        {
          sortable: true,
          field: 'sales_sup_id',
          title: '出貨對象'
        },
        {
          sortable: true,
          field: 'shipment_qty',
          title: '出貨重量'
        },
        {
          sortable: true,
          field: 'package_qty',
          title: '單件重量'
        },
        {
          sortable: true,
          field: 'item_grading',
          title: '分級'
        },
        {
          sortable: true,
          field: 'memo',
          title: '備註'
        }
      ]
      break;
    default:
  }
  $('#GACP_table').bootstrapTable('destroy')
  $('#GACP_table').bootstrapTable({
    url: search_url,
    pagination: true,
    search: true,
    sortable: true,
    columns: search_columns
  })
}

function search_sensor_data() {
  let start_date = $("#start_date").val()
  let end_date = $("#end_date").val()
  let search_target = $("#search_target").val()
  let data_interval = $("#data_interval").val()
  $.ajax(
    {
      url: "/api/datas?field=" + location.search.split("f")[1].split("t")[0] + "&start_date=" + start_date + "&end_date=" + end_date + "&search_target=" + search_target + "&data_interval=" + data_interval
    }
  ).done(function (data) {
    var date_labels = []
    var date_datas = []
    if (data_interval == 'hour') {
      for (i = data.length - 1; i >= 0; i--) {
        date_labels.push(data[i].date + " " + data[i].hour + ":00")
        date_datas.push(data[i].value)
      }
    } else if (data_interval == 'day') {
      for (i = data.length - 1; i >= 0; i--) {
        date_labels.push(data[i].date)
        date_datas.push(data[i].value)
      }
    }
    refresh_table(date_labels, date_datas, 'field_sensor_chart', 'chart_container', $("#search_target :selected").text())
  }).fail(function () {
    return;
  })
  return false;
}

var gallery_items = [];
var farm_images = ""
function search_ipcam_data(interval) {
  let ipcam_date = $("#ipcam_date").val()
  $("#ipcam_pic_box").html("")
  $.ajax(
    {
      url: "/api/ipcam_picture" + location.search + "&start_date=" + ipcam_date + "&interval=" + interval
    }
  ).done(
    function (data) {
      farm_images = data
      if (farm_images.length) {
        for (let [index, row] of farm_images.entries()) {
          $("#ipcam_pic_box").append('<div class="card col-xs-6 ipcam_img_box"><img class="card-img-top ipcam_pic_card" src="' + row.img_path + '" alt="圖片毀損" onclick="ipcam_swipe_gallery(' + index + ')"><div class="card-body"><h5 class="card-title">' + row.time + '</h5></div></div>')
        }
      } else {
        $("#ipcam_pic_box").append('<div class="card col-xs-12">期間內沒有影像紀錄</div>')
      }
      return;
    }
  ).fail(
    function () {
      return;
    }
  )
  return false;
}

function watch_ipcam_time_lapse() {
  $.ajax(
    {
      url: '/api/ipcam_time_lapse' + location.search
    }
  ).done(function (data) {
    $("#ipcam_pic_box").html("").append(
      `<video width="100%" style="margin-top:10px;padding:0 15px;" src="${data}" type="video/webm" controls>
      您的瀏覽器不支援影片格式，建議使用Google Chrome瀏覽器
      </video>
      <div class="text-center">如果不能觀看，建議您使用Google Chrome瀏覽器</div>
      <div class="text-center"><a class="text-center" href="${data}" download>IOS系統請點此下載觀看</a></div>`
    )
  }).fail(function (e) {
    alert('生成影像失敗')
  })
}

function dump_farm_images(images) {
  if (images.length) {
    gallery_items = []
    for (let [index, row] of images.entries()) {
      gallery_items.push({ src: row.img_path, w: 960, h: 540, title: row.time })
    }
  }
}

function ipcam_swipe_gallery(index) {
  var pswpElement = document.querySelectorAll('.pswp')[0];
  dump_farm_images(farm_images)
  var options = { index: index }
  var gallery = new PhotoSwipe(pswpElement, PhotoSwipeUI_Default, gallery_items, options);
  gallery.init();
}

function report_swipe_gallery(index) {
  var pswpElement = document.querySelectorAll('.pswp')[0];
  var options = { index: index }
  gallery_items = []
  $(".report_image").each(function () {
    gallery_items.push({ src: $(this).attr("src"), w: 0, h: 0, title: $(this).attr("title") })
  })
  var gallery = new PhotoSwipe(pswpElement, PhotoSwipeUI_Default, gallery_items, options);
  gallery.listen('gettingData', function (index, item) {
    if (item.w < 1 || item.h < 1) { // unknown size
      var img = new Image();
      img.onload = function () {
        item.w = this.width;
        item.h = this.height;
        gallery.invalidateCurrItems();
        gallery.updateSize(true);
      }
      img.src = item.src;
    }
  });
  gallery.init();
}

function refresh_table(new_labels, new_datas, chart_id, chart_container_id, data_label) {
  $("#" + chart_id).remove()
  $("#" + chart_container_id).append('<canvas id="' + chart_id + '"></canvas>')
  var ctx = document.getElementById(chart_id).getContext('2d');
  var chart = new Chart(ctx, {
    type: 'line',
    data: {
      labels: new_labels,
      datasets: [{
        label: data_label,
        backgroundColor: 'rgb(5, 185, 65)',
        borderColor: 'rgb(0, 60, 15)',
        data: new_datas
      }]
    },
    options: {
      tooltips: {
        mode: 'nearest',
        intersect: false
      }
    }
  });
}

function purchase_link(link) {
  Swal.fire({
    title: "您即將前往外部網站",
    text: "此網址由農場主提供，確定要前往?",
    icon: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    confirmButtonText: "確認",
    cancelButtonText: "取消"
  }).then((result) => {
    if (result.value) {
      window.open(link)
    }
  })
  return false;
}

var cwb_datas = []
var cwb_interval = $("#cwb_interval").val()

function search_cwb_data() {
  let date = $("#cwb_date").val()
  cwb_interval = $("#cwb_interval").val()
  $.ajax(
    {
      url: "/api/cwb_crawler?interval=" + cwb_interval + "&station=" + cwb_no + "&datepicker=" + date
    }
  ).done(
    function (data) {
      cwb_datas = data
      $("#cwb_title").text("氣象局資料查詢 - " + cwb_datas[0]['location'] + "觀測站")
      if (cwb_interval == "day") {
        cwb_date_field($("#daily_cwb_interval"))
      } else if (cwb_interval == "month") {
        cwb_date_field($("#month_cwb_interval"))
      }
    }
  ).fail(
    function () {
      cwb_datas = []
      $("#cwb_chart").remove()
      return;
    }
  )
}

function cwb_date_range() {
  cwb_interval = $("#cwb_interval").val()
  cwb_datas = []
  $("#cwb_chart").remove()
  if (cwb_interval == "day") {
    $("#cwb_date").prop("type", "date")
    $("#month_cwb_interval").hide()
    $("#daily_cwb_interval").show()
  } else if (cwb_interval == "month") {
    $("#cwb_date").prop("type", "month")
    $("#daily_cwb_interval").hide()
    $("#month_cwb_interval").show()
  }
}

$("#cwb_date").on("change", function () {
  cwb_datas = []
  $("#cwb_chart").remove()
})

function cwb_date_field(obj) {
  $("#cwb_chart").remove()
  if (cwb_datas.length > 0) {
    var option = $(obj).find(":selected").val()
    var cwb_labels = []
    var cwb_dataset = []
    for (var i = 1; i < cwb_datas.length; i++) {
      cwb_labels.push(cwb_datas[i]["time"])
      cwb_dataset.push(cwb_datas[i]["datas"][option])
    }
    refresh_table(cwb_labels, cwb_dataset, 'cwb_chart', 'cwb_chart_container', $(obj).find(":selected").text())
  } else {
    cwb_datas = []
    $("#cwb_chart").remove()
  }
}

function search_price_trend() {
  var interval = $("#price_trend_interval").val()
  var cultivar = $("#price_trend_cultivar").val()
  var market = $("#price_trend_market").val()
  var current_date = new Date();
  var start_date = new Date();

  if (interval == "year") {
    start_date.setFullYear(start_date.getFullYear() - 1)
    start_date.setMonth(start_date.getMonth() - 1)
    current_date.setDate(current_date.getDate() - 1)
    start_date.setDate(1)
  } else if (interval == "month") {
    start_date.setMonth(start_date.getMonth() - 1)
    current_date.setDate(current_date.getDate() - 1)
  } else if (interval == "week") {
    start_date.setDate(start_date.getDate() - 7)
    current_date.setDate(current_date.getDate() - 1)
  }
  let start = time_format_convert(start_date, "trede", toROC = true)
  let end = time_format_convert(current_date, "trede", toROC = true)
  $.ajax(
    {
      url: `/api/farm_trans_data?crop=${cultivar}&startdate=${start}&enddate=${end}&market=${market}`,
      type: 'GET'
    }
  ).done(function (data) {
    update_price_trend_chart(data)
  }).fail(function (e) {
    console.log(e)
  })
}


function update_price_trend_chart(trend_data) {
  var interval = $("#price_trend_interval").val()
  var order_data = trend_data.reverse()
  var labels = []
  var datas = { 'avg_price': [], 'high_price': [], 'mid_price': [], 'low_price': [], 'shipment': [] }
  if (order_data && order_data.length) {
    var current_date_array = order_data[0]['交易日期'].split('.')//ex 109.07.25 => ['109','07','25']
    switch (interval) {
      case 'week':
        for (data in order_data) {
          var current_data = order_data[data]
          var data_date_array = current_data['交易日期'].split('.')
          labels.push(current_data['交易日期'])
          price_trend_chart_datas_push(datas, [current_data['平均價'], current_data['上價'], current_data['中價'], current_data['下價'], current_data['交易量']])
          current_date_array = data_date_array
        }
        price_trend_chart_change_data_and_label(price_trend_chart, labels, datas)
        break;
      case 'month':
        for (data in order_data) {
          var current_data = order_data[data]
          var data_date_array = current_data['交易日期'].split('.')
          labels.push(current_data['交易日期'])
          price_trend_chart_datas_push(datas, [current_data['平均價'], current_data['上價'], current_data['中價'], current_data['下價'], current_data['交易量']])
          current_date_array = data_date_array
        }
        price_trend_chart_change_data_and_label(price_trend_chart, labels, datas)
        break;
      case 'year':
        var monthly_data_counter = 0
        var monthly_data_register = { 'avg_price': 0, 'high_price': 0, 'mid_price': 0, 'low_price': 0, 'shipment': 0 }
        var current_month = ''
        for (data in order_data) {
          var current_data = order_data[data]
          var data_month = current_data['交易日期'].substr(0, 6) //ex '109.01.02' => '109.01'
          if (current_month == '') {
            current_month = data_month
            labels.push(data_month)
          }
          if (current_month != data_month) {
            //month change init
            labels.push(data_month)
            price_trend_chart_datas_push(datas,
              [
                Math.round(monthly_data_register['avg_price'] / monthly_data_counter),
                Math.round(monthly_data_register['high_price'] / monthly_data_counter),
                Math.round(monthly_data_register['mid_price'] / monthly_data_counter),
                Math.round(monthly_data_register['low_price'] / monthly_data_counter),
                Math.round(monthly_data_register['shipment'] / monthly_data_counter)
              ])
            monthly_data_counter = 0
            monthly_data_register = { 'avg_price': 0, 'high_price': 0, 'mid_price': 0, 'low_price': 0, 'shipment': 0 }
            current_month = data_month
          }
          if ((current_data['交易量'] == 0)) {
            continue;
          }
          console.log(current_data['交易日期'])
          monthly_data_register['avg_price'] += current_data['平均價']
          monthly_data_register['high_price'] += current_data['上價']
          monthly_data_register['mid_price'] += current_data['中價']
          monthly_data_register['low_price'] += current_data['下價']
          monthly_data_register['shipment'] += current_data['交易量']
          monthly_data_counter += 1
        }
        price_trend_chart_datas_push(datas,
          [
            Math.round(monthly_data_register['avg_price'] / monthly_data_counter),
            Math.round(monthly_data_register['high_price'] / monthly_data_counter),
            Math.round(monthly_data_register['mid_price'] / monthly_data_counter),
            Math.round(monthly_data_register['low_price'] / monthly_data_counter),
            Math.round(monthly_data_register['shipment'] / monthly_data_counter)
          ])
        monthly_data_counter = 0
        monthly_data_register = { 'avg_price': 0, 'high_price': 0, 'mid_price': 0, 'low_price': 0, 'shipment': 0 }
        current_month = data_month
        price_trend_chart_change_data_and_label(price_trend_chart, labels, datas)
        price_trend_chart.update()
        break;
      default:
    }
  } else {
    price_trend_chart_change_data_and_label(price_trend_chart, [], { 'avg_price': [], 'high_price': [], 'mid_price': [], 'low_price': [], 'shipment': [] })
    price_trend_chart.update()
  }
}

function price_trend_chart_datas_push(datas, data_array) {
  datas['avg_price'].push(data_array[0])
  datas['high_price'].push(data_array[1])
  datas['mid_price'].push(data_array[2])
  datas['low_price'].push(data_array[3])
  datas['shipment'].push(data_array[4])
}

function price_trend_chart_change_data_and_label(chart, labels, datas) {
  chart.data.labels = labels
  chart.data.datasets[0].data = datas['avg_price']
  chart.data.datasets[1].data = datas['high_price']
  chart.data.datasets[2].data = datas['mid_price']
  chart.data.datasets[3].data = datas['low_price']
  chart.data.datasets[4].data = datas['shipment']
  chart.update()
}

function time_format_convert(time, mode, toROC = false) {
  switch (mode) {
    case "trede":
      //ex new Date(2020, 0, 25) => '109.01.25'
      let year = time.getFullYear()
      if (toROC) {
        year -= 1911
      }
      let month = time.getMonth() + 1 < 10 ? '0' + (time.getMonth() + 1) : time.getMonth() + 1
      let date = time.getDate() < 10 ? '0' + time.getDate() : time.getDate()
      return `${year}.${month}.${date}`
    default:
  }
}

function add_date(date_split_array, interval = 1) {
  //date_split_array should like [ROC_year, month, day] ex. ['109','01','25']
  //new Date(2020, 0, 25) represent 2020/01/25
  var new_date = new Date(parseInt(date_split_array[0]) + 1911, parseInt(date_split_array[1]) - 1, parseInt(date_split_array[2]) + interval)
  return time_format_convert(new_date, 'trede', toROC = true)
}

$("#farm_intro_link").attr("href", "/trace/farmintro?no=" + location.search.split("no=")[1].split("f")[0])
$("#month_cwb_interval").hide()

var ctx2 = document.getElementById('price_trend_chart');
var price_trend_chart = new Chart(ctx2, {
  type: 'bar',
  data: {
    labels: [],
    datasets: [{
      label: '平均價',
      data: [],
      borderColor: 'rgba(0, 0, 0, 0.5)',
      backgroundColor: 'rgba(0, 0, 0, 0)',
      type: 'line',
      yAxisID: 'y-axis-1'
    }, {
      label: '上價',
      data: [],
      borderColor: 'rgba(223, 2, 2, 0.5)',
      backgroundColor: 'rgba(0, 0, 0, 0)',
      type: 'line',
      yAxisID: 'y-axis-1'
    }, {
      label: '中價',
      data: [],
      borderColor: 'rgba(201, 223, 2, 0.5)',
      backgroundColor: 'rgba(0, 0, 0, 0)',
      type: 'line',
      yAxisID: 'y-axis-1'
    }, {
      label: '下價',
      data: [],
      borderColor: 'rgba(2, 72, 223, 0.5)',
      backgroundColor: 'rgba(0, 0, 0, 0)',
      type: 'line',
      yAxisID: 'y-axis-1'
    },
    {
      label: '交易量(公斤)',
      data: [],
      backgroundColor: 'rgba(75, 192, 192, 0.5)',
      categoryPercentage: 0.5,
      yAxisID: 'y-axis-2'
    }]
  },
  options: {
    responsive: true,
    aspectRatio: 1.2,
    spanGaps: false,
    tooltips: {
      mode: 'index',
      intersect: false,
    },
    hover: {
      mode: 'nearest',
      intersect: true
    },
    scales: {
      xAxes: [{
        barPercentage: 0.4
      }],
      yAxes: [{
        type: 'linear',
        display: true,
        position: 'left',
        id: 'y-axis-1',
        ticks: {
          beginAtZero: true
        }
      },
      {
        type: 'linear',
        display: true,
        position: 'right',
        id: 'y-axis-2',
        ticks: {
          beginAtZero: true
        }
      }]
    }
  }
});