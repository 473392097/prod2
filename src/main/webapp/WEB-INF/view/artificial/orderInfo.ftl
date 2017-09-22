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
            <input type="text" name="prd_name" value="" autocomplete="off" class="layui-input">
        </div>
        <label class="layui-form-label">订单编号</label>
        <div class="layui-input-inline">
            <input type="text" name="prd_dtl_name"  value="" autocomplete="off" class="layui-input">
        </div>

        <label class="layui-form-label">会员编号</label>
        <div class="layui-input-inline">
            <input type="text" name="prd_dtl_name"  value="" autocomplete="off" class="layui-input">
        </div>


        <label class="layui-form-label">订单区分</label>
        <div class="layui-input-inline">
            <input type="text" name="prd_dtl_name"  value="" autocomplete="off" class="layui-input">
        </div>

        <#--<label class="layui-form-label">销售价格</label>-->
        <#--<div class="layui-input-inline" style="width: 100px;">-->
            <#--<input name="price_min" value="${param.price_min! ''}" placeholder="￥" autocomplete="off" class="layui-input" type="text">-->
        <#--</div>-->
        <#--<div class="layui-form-mid">-</div>-->
        <#--<div class="layui-input-inline" style="width: 100px;">-->
            <#--<input name="price_max" value="${param.price_max! ''}" placeholder="￥" autocomplete="off" class="layui-input" type="text">-->
        <#--</div>-->
    </div>

    <#--<div class="layui-form-item">-->
        <#--<label class="layui-form-label">仓储名称</label>-->
        <#--<div class="layui-input-inline">-->
            <#--<input type="text" name="w_name"  value="${param.w_name! ''}" autocomplete="off" class="layui-input">-->
        <#--</div>-->
        <#--<label class="layui-form-label">库存数量</label>-->
        <#--<div class="layui-input-inline" style="width: 100px;">-->
            <#--<input name="count_min" value="${param.count_min! ''}" autocomplete="off" class="layui-input" type="text">-->
        <#--</div>-->
        <#--<div class="layui-form-mid">-</div>-->
        <#--<div class="layui-input-inline" style="width: 100px;">-->
            <#--<input name="count_max" value="${param.count_max! ''}" autocomplete="off" class="layui-input" type="text">-->
        <#--</div>-->
        <#--<label class="layui-form-label">是否使用</label>-->
        <#--<div class="layui-input-inline">-->
            <#--<select id="isUsed" name="is_used" >-->
                <#--<option value="y">使用</option>-->
                <#--<option value="n">禁用</option>-->
            <#--</select>-->
        <#--</div>-->


        <#--<div class="layui-input-inline">-->
            <#--<button class="layui-btn" lay-submit lay-filter="pageSubmit">确认</button>-->
            <#--<button type="reset" class="layui-btn layui-btn-primary">重置</button>-->
        <#--</div>-->
    <#--</div>-->
</form>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>所有订单详情信息</legend>
</fieldset>

<div class="layui-form">
    <table class="layui-table">
        <colgroup>
            <col width="50">
            <col width="50">
            <col width="50">
            <col width="50">
            <col width="50">
            <col width="50">
            <col width="50">
            <col width="50">
            <col width="50">
            <col width="50">
            <col width="50">
            <col width="50">
            <col width="50">
            <col width="50">
            <col width="50">
            <col width="50">
            <col width="50">
            <col width="50">
            <col width="50">
            <col width="50">
            <col>
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
            <th>收货省id</th>
            <th>收货省名称</th>
            <th>收货市名称</th>
            <th>详细收货地址</th>
            <th>面单号</th>
            <th>添加人编号</th>
            <th>添加人时间</th>
        </tr>
        </thead>
        <tbody>
        <#--<#list list as item>-->
        <#--<tr>-->
            <#--<td><img width="120" height="70" src="${item.img_url}"/></td>-->
            <#--<td>${item.prd_name! ''}</td>-->
            <#--<td>${item.prd_dtl_id! ''}</td>-->
            <#--<td>${item.prd_dtl_name! ''}</td>-->
            <#--<td>${item.source_price! ''}</td>-->
            <#--<td>${item.sale_price! ''}</td>-->
            <#--<td>-->
                <#--<#if item.is_used=='y'>使用-->
                <#--<#else>禁用-->
                <#--</#if>-->
            <#--</td>-->
        <#--&lt;#&ndash;<td>${item.w_name}</td>&ndash;&gt;-->
            <#--<td>${item.totalcount! ''}</td>-->
            <#--<td><button value="${item.prd_dtl_id! ''}" class="manageMenu layui-btn layui-btn-normal layui-btn-small"><i class="layui-icon">修改</i></button>-->
                <#--<button value="${item.prd_dtl_id! ''}" class="manageMenu1 layui-btn layui-btn-normal layui-btn-small"><i class="layui-icon">查看</i></button>-->
                <#--<button value="${item.prd_dtl_id! ''}n${item.prd_id}" class="manageMenu2 layui-btn layui-btn-normal layui-btn-small"><i class="layui-icon">添加</i></button>-->
            <#--</td>-->

        <#--</tr>-->
        <#--</#list>-->
        </tbody>
    </table>
</div>
<div class="layui-form">
    <#--<span id="form_page"></span>&nbsp;共${page.total! ''}条数据-->
</div>
<form id="pageSubmit">
    <input type="hidden" id="currentPage" name="currentPage" >
</form>
<script type="text/javascript" src="/resources/layui/layui.js"></script>
<script type="text/javascript">

    layui.define([ 'element', 'form', 'layer', 'laypage'], function(exports) {
        var element = layui.element();
        var form = layui.form();
        var layer = layui.layer;
        var laypage = layui.laypage;
        var $ = layui.jquery;

        <#--var pindex = "${page.pageNum}";// 当前页-->
        <#--var ptotalpages = "${page.pages}";// 总页数-->
        <#--var pcount = "${page.total}";// 数据总数-->
        <#--var isused="${param.is_used! ''}";-->
// 菜单级别动态赋值
        if(isused == 'y') {
            $("#isUsed").find("option[value = 'y']").attr("selected","selected");

        } else if(isused == 'n') {
            $("#isUsed").find("option[value = 'n']").attr("selected","selected");



        }
        // 重新渲染页面
        form.render();
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
                    $("#pageSubmit").submit();
                }else{
                    $("#currentPage").val(1)
                }
            }
        });

        //监听修改事件
        $(".manageMenu").on("click",function(){
            var id = $(this).val()
            layer.open({
                title: '管理菜单 - 惠买ivalue管理系统'
                ,area: ['500px', '300px']
                ,type: 2 //content内容为一个连接
                ,content: '/prd/getUpdatePage.do?id='+id
            });
        });

        //查看该明细下的所有仓库对应信息
        $(".manageMenu1").on("click",function(){
            var id = $(this).val()
            layer.open({
                title: '查看 - 惠买ivalue管理系统'
                ,area: ['60%', '500px']
                ,type: 2 //content内容为一个连接
                ,content: '/prd/getDetailInfo.do?id='+id
            });
        });

        //添加该明细下的仓库对应信息
        $(".manageMenu2").on("click",function(){
            var id = $(this).val()
            layer.open({
                title: '添加 - 惠买ivalue管理系统'
                ,area: ['60%', '500px']
                ,type: 2 //content内容为一个连接
                ,content: '/prd/addDetailInfo.do?id='+id
            });
        });
    });
</script>
</body>
</html>