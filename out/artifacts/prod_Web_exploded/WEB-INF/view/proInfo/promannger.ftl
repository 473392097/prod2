<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="Generator" content="EditPlus®">
    <meta name="Author" content="">
    <meta name="Keywords" content="">
    <meta name="Description" content="">
    <title>商品查询</title>
    <link rel="stylesheet" href="/resources/layui/css/layui.css">
</head>

<body>
<fieldset class="layui-elem-field" style="height: 20%">
    <legend>商品查询</legend>
    <div class="layui-field-box">
        <form class="layui-form" id="pageSubmit">
            <div class="layui-form-item">

                <label class="layui-form-label">商品编号</label>
                <div class="layui-input-inline">
                    <input type="text" id="prdNo" name="prdNo" value="${params.prdNo!''}" placeholder="请输入"
                           autocomplete="off" class="layui-input">
                </div>

                <label class="layui-form-label">商品名称</label>
                <div class="layui-input-inline">
                    <input type="text" id="prdName" name="prdName" value="${params.prdName!''}" placeholder="请输入"
                           autocomplete="off" class="layui-input">
                </div>


                <label class="layui-form-label">参加活动</label>
                <div class="layui-input-inline">
                    <select id="isSales" name="isSales">
                        <option value="">请选择</option>
                        <option value="y">参加</option>
                        <option value="n">不参加</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">商品简码</label>
                <div class="layui-input-inline">
                    <input type="text" id="prdCode" name="prdCode" value="${params.prdCode!''}" placeholder="请输入"
                           autocomplete="off" class="layui-input">
                </div>


                <label class="layui-form-label">退换货</label>
                <div class="layui-input-inline">
                    <select id="isReturn" name="isReturn">
                        <option value="">请选择</option>
                        <option value="y">支持</option>
                        <option value="n">不支持</option>
                    </select>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">商品类别</label>
                <div class="layui-input-inline">
                    <select id="prdType" name="prdType">
                        <option value="">请选择</option>
                    <#list proType as item>
                        <option value="${item.tp_cd}">${item.tp_name}</option>
                    </#list>
                    </select>
                </div>


                <label class="layui-form-label">上架时间</label>
                <div class="layui-input-inline">
                    <input id="instDate1" name="instDate1" type="date" value="${params.instDate1!''}" placeholder="开始日"
                           onclick="layui.laydate({elem: this})">
                </div>

                <div class="layui-input-inline">
                    <input id="instDate1" name="instDate2" type="date" value="${params.instDate2!''}" placeholder="截止日"
                           onclick="layui.laydate({elem: this})">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">售卖方式</label>
                <div class="layui-input-inline">
                    <select id="saleCode" name="saleCode">
                        <option value="">请选择</option>
                        <option value="100">热线</option>
                        <option value="200">网站</option>
                        <option value="300">手机app</option>
                    </select>
                </div>

                <label class="layui-form-label">是否使用</label>
                <div class="layui-input-inline">
                    <select id="isUsed" name="isUsed">
                        <option value="">请选择</option>
                        <option value="y">是</option>
                        <option value="n">否</option>
                    </select>
                </div>


                <label class="layui-form-label">供应商</label>
                <div class="layui-input-inline">
                    <select id="supId" name="supId">
                        <option value="">请选择</option>
                    <#list supplier as item>
                        <option value="${item.id}">${item.sup_name}</option>
                    </#list>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">捆绑销售</label>
                <div class="layui-input-inline">
                    <select id="isGifts" name="isGifts">
                        <option value="">请选择</option>
                        <option value="y">捆绑</option>
                        <option value="n">不绑</option>
                    </select>
                </div>


                <div class="layui-input-inline">
                    <button class="layui-btn" lay-submit lay-filter="registerForm">立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
            <input type="hidden" id="currentPage" name="currentPage">
        </form>
    </div>
</fieldset>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>商品列表</legend>
</fieldset>
<div class="layui-form">
    <table class="layui-table">
        <colgroup>
            <col width="100">
            <col width="100">
            <col width="100">
            <col width="100">
            <col width="100">
            <col width="100">
            <col width="100">
            <col width="100">
            <col width="100">
            <col width="60">
            <col width="60">
            <col width="200">
            <col width="400">
        </colgroup>
        <thead>
        <tr>
            <th>商品编号</th>
            <th>商品名称</th>
            <th>商品简码</th>
            <th>商品类别</th>
            <th>供应商</th>
            <th>供应商公司</th>
            <th>上架时间</th>
            <th>参与活动</th>
            <th>售卖方式</th>
            <th>是否为赠品</th>
            <th>支持退换货</th>
            <th>是否使用</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <#list list as item>
        <tr>
            <td>${item.prdNo}</td>
            <td>${item.prdName}</td>
            <td>${item.prdCode}</td>
            <td>${item.tpName}</td>
            <td>${item.supName}</td>
            <td>${item.supComp}</td>
            <td>${item.shDate}</td>
            <td>
                <#if item.isSales=='y'>是
                <#else>否
                </#if>
            </td>
            <td>
                <#if item.saleCode=='100'>热线
                </#if>
                <#if item.saleCode=='200' >网站
                <#else>手机app
                </#if>
            </td>
            <td>
                <#if item.isGifts=='y'>是
                <#else>否
                </#if>
            </td>
            <td>
                <#if item.isReturn=='y'>是
                <#else>否
                </#if>
            </td>
            <td>
                <#if item.isUsed=='y'>是
                <#else>否
                </#if>
            </td>
            <td><div><input  id="send" hidden="hidden" value="${item.prdNo}">

                <a class="addplus"   href="javascript:;">添加明细</a> </div>&nbsp;&nbsp;
                <div><input  id="send" hidden="hidden" value="${item.prdNo}">
                <a class="update" href="javascript:;">修改</a>
            </div>
            </td>
        </tr>
        </#list>
        </tbody>
    </table>
</div>
<div class="layui-form">
    <span id="form_page"></span>&nbsp;共${page.total}条数据
</div>
<script type="text/javascript" src="/resources/layui/layui.js"></script>
<script type="text/javascript">

    layui.define(['element', 'form', 'layer', 'laypage', 'laydate'], function (exports) {
        var element = layui.element();
        var form = layui.form();
        var layer = layui.layer;
        var laypage = layui.laypage;
        var $ = layui.jquery;

        var pindex = "${page.pageNum}";// 当前页
        var ptotalpages = "${page.pages}";// 总页数
        var pcount = "${page.total}";// 数据总数
        var data = $("form").serializeArray();
        // 分页
        laypage({

            cont: 'form_page', // 页面上的id
            pages: ptotalpages,//总页数
            curr: pindex,//当前页。
            data: data,
            skip: true,

            jump: function (obj, first) {
                $("#currentPage").val(obj.curr);//设置当前页
                //防止无限刷新,
                //只有监听到的页面index 和当前页不一样是才出发分页查询
                if (obj.curr != pindex) {
                    $("#pageSubmit").submit();
                }
            }

        });
        var isSales2 = "${params.isSales!''}";
        var ss1 = "#isSales option[value='" + isSales2 + "']";
        $(ss1).attr('selected', 'selected');

        var isReturn2 = "${params.isReturn!''}";
        var ss2 = "#isReturn option[value='" + isReturn2 + "']";
        $(ss2).attr('selected', 'selected');

        var prdType2 = "${params.prdType!''}";
        var ss3 = "#prdType option[value='" + prdType2 + "']";
        $(ss3).attr('selected', 'selected');

        var saleCode2 = "${params.saleCode!''}";
        var ss4 = "#saleCode option[value='" + saleCode2 + "']";
        $(ss4).attr('selected', 'selected');

        var isUsed2 = "${params.isUsed!''}";
        var ss5 = "#isUsed option[value='" + isUsed2 + "']";
        $(ss5).attr('selected', 'selected');

        var supId2 = "${params.supId!''}";
        var ss6 = "#supId option[value='" + supId2 + "']";
        $(ss6).attr('selected', 'selected');

        var isGifts2 = "${params.isGifts!''}";
        var ss7 = "#isGifts option[value='" + isGifts2 + "']";
        $(ss7).attr('selected', 'selected');
        form.render();

        // 添加商品明细
        $(".addplus").on("click", function () {

            layer.open({
                title: '修改'
                , area: ['700px', '600px']
                , type: 2 //content内容为一个连接

                , content: '/prd/addProDetails.do?prdNo=' + $(this).prev("#send").val()
            });
        })
        // 修改商品信息
        $(".update").on("click", function () {

            layer.open({
                title: '修改'
                , area: ['500px', '400px']
                , type: 2 //content内容为一个连接

                , content: '/prd/getProInfo.do?prdNo=' + $(this).prev("#send").val()
            });
        })
    })
</script>
</body>
</html>