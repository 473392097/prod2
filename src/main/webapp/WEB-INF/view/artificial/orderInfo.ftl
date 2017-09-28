<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="Generator" content="EditPlus®">
    <meta name="Author" content="">
    <meta name="Keywords" content="">
    <meta name="Description" content="">
    <title>商品管理系统 惠买ivalue后台管理</title>
    <link rel="stylesheet" href="/resources/layui/css/layui.css">
</head>

<body>
<form id="pageSubmit" class="layui-form">
    <input type="hidden" id="currentPage" name="currentPage" >

    <div class="layui-form-item">
        <label class="layui-form-label">主键</label>
        <div class="layui-input-inline">
            <input type="text" name="id" value="" autocomplete="off" class="layui-input">
        </div>
        <label class="layui-form-label">订单编号</label>
        <div class="layui-input-inline">
            <input type="text" name="ord_no"  value="" autocomplete="off" class="layui-input">
        </div>
        <label class="layui-form-label">会员编号</label>
        <div class="layui-input-inline">
            <input type="text" name="vip_no"  value="" autocomplete="off" class="layui-input">
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">订单区分</label>
        <div class="layui-input-inline">
            <input type="text" name="ord_tp_cd"  value="" autocomplete="off" class="layui-input">
        </div>

        <label class="layui-form-label">订单日期</label>
        <div class="layui-input-inline" style="width: 100px;">
            <input name="date_min"  placeholder="起始时间" autocomplete="off" class="layui-input"  onclick="layui.laydate({elem: this})"  type="text">
        </div>
        <div class="layui-form-mid">-</div>
        <div class="layui-input-inline" style="width: 100px;">
            <input name="date_max"  placeholder="结束时间" autocomplete="off" class="layui-input" onclick="layui.laydate({elem: this})" type="text">
        </div>

    </div>



    <div class="layui-form-item">
        <div class="layui-input-block">
            <button  id="layui-btn"  class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>


</form>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>所有订单详情信息</legend>
</fieldset>

<div class="layui-form">
    <table class="layui-table">
        <colgroup>
            <col width="10%">
            <col width="10%">
            <col width="10%">
            <col width="10%">
            <col width="10%">
            <col width="10%">
            <col width="5%">
            <col width="5%">
            <col width="5%">
            <col width="5%">
            <col width="5%">
            <col width="5%">
            <col width="5%">
            <col width="5%">

        </colgroup>
        <thead>
        <tr>
            <th>主键</th>
            <th>订单编号</th>
            <th>会员编号</th>
            <th>订单区分</th>
            <th>下单日期</th>
            <th>订单状态</th>
            <th>原订单编号</th>
            <th>订单金额</th>
            <th>实际支付金额</th>
            <th>发票金额</th>
            <th>收件人名称</th>
            <th>发票id</th>
            <th>可售后时间</th>
            <th>详细收货地址</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <#list list as item>
        <tr>
            <td>${item.id! ''}</td>
            <td>${item.ord_no! ''}</td>
            <td>${item.vip_no! ''}</td>
            <td>${item.ord_tp_cd! ''}</td>
            <td>${item.ord_crt_date! ''}</td>
            <td>${item.ord_sts_cd! ''}</td>
            <td>${item.pre_ord_no! ''}</td>
            <td>${item.ord_price! ''}</td>
            <td>${item.real_price! ''}</td>
            <td>${item.bill_price! ''}</td>
            <td>${item.del_name! ''}</td>
            <td>${item.bill_id! ''}</td>
            <td>${item.addr_c_name! ''}</td>
            <td>${item.addr_detail! ''}</td>

            <td>
                <div class="layui-btn-group">
                    <button id="cancel"  name="cancel" type="button" value="${item.ord_no! ''}" lay-filter="cancel"   class="layui-btn layui-btn-small cancel">
                     取消订单
                    </button>
                </div>
            </td>


        </tr>
        </#list>
        </tbody>
    </table>
</div>
<div class="layui-form">
    <span id="form_page"></span>&nbsp;共${page.total! ''}条数据
</div>
<#--<form id="pageSubmit">-->
    <#--<input type="hidden" id="currentPage" name="currentPage" >-->
<#--</form>-->
<script type="text/javascript" src="/resources/layui/layui.js"></script>
<script type="text/javascript">

    layui.define([ 'element', 'form','jquery', 'layer','laydate', 'laypage'], function(exports) {
        var element = layui.element();
        var form = layui.form();
        var layer = layui.layer;
        var laypage = layui.laypage;
        var $ = layui.jquery;

        var pindex = "${page.pageNum}";// 当前页
        var ptotalpages = "${page.pages}";// 总页数
        var pcount = "${page.total}";// 数据总数

        // 分页
        laypage({
            cont : 'form_page', // 页面上的id
            pages : ptotalpages,//总页数
            curr : pindex,//当前页。
            skip : true,

            jump : function(obj, first) {

                $("#currentPage").val(obj.curr);//设置当前页

                //防止无限刷新,
                //只有监听到的页面index 和当前页不一样是才出发分页查询
                if (obj.curr != pindex ) {
                    console.log(pindex)
                    console.log(pindex)
                    $("#pageSubmit").submit();
                }else {
                    $("#currentPage").val(1);
                }
            }
        });

//            // 监听注册按钮
//            form.on('submit(formDemo)', function(data){
//    //            layer.msg(JSON.stringify(data.field));
//                $.ajax({
//                    url: "/order/orderPage.do",  //后台程序地址
//                    type: "POST",
//                    data: data.field,  //需要post的数据
//                    success:function (data) {
//                    }
//
//                });
//
//            });


        // 监听取消订单按钮
        $(".cancel").on("click",function(){

            var ord_no =this.value
            console.log($(this))
            console.log( $(".cancel"))
            layer.open({
                title: '取消成功'
                ,area: ['10px', '10px']
                ,type: 2 //content内容为一个连接
                ,content: '/order/cancelOrder.do?ord_no=' + ord_no
            });

            $(this).attr("disabled",true);
//            $(this).style.color="Red";
            $(this).attr("style","color:#9BA5AF;");

        })



//        $(".cancel").on("click",function(){
//            alert("lilili")
//            $.ajax({
//                url: "/order/cancelOrder.do?ord_no=' + ord_no",  //后台程序地址
//                type: "POST",
//                data: data.field,  //需要post的数据
//                success:function (data) {
//                    layer.msg("取消成功")
//                }
//            });
//        }

        form.render();
    });

</script>
</body>
</html>