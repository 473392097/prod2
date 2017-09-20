<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="Generator" content="EditPlus®">
    <meta name="Author" content="">
    <meta name="Keywords" content="">
    <meta name="Description" content="">
    <title>客服系统 惠买ivalue后台管理</title>
    <link rel="stylesheet" href="/resources/layui/css/layui.css">
</head>

<body>

<form id="pageSubmit" class="layui-form">


    <#--<div class="layui-form-item">-->
        <#--<label class="layui-form-label">客户姓名</label>-->
        <#--<div class="layui-input-inline">-->
            <#--<input type="text" name="name" value="" autocomplete="off" class="layui-input">-->
        <#--</div>-->
        <#--<label class="layui-form-label">客户电话号码</label>-->
        <#--<div class="layui-input-inline">-->
            <#--<input type="text" name="name" value="" autocomplete="off" class="layui-input">-->
        <#--</div>-->

    <#--</div>-->

    <#--<div class="layui-form-item">-->
        <#--<label class="layui-form-label">客户昵称</label>-->
        <#--<div class="layui-input-inline">-->
            <#--<input type="text" name="prd_dtl_id"  value="" autocomplete="off" class="layui-input">-->
        <#--</div>-->



        <#--<div class="layui-input-inline">-->
            <#--<button class="layui-btn" lay-submit >查询</button>-->
            <#--<button type="reset" class="layui-btn layui-btn-primary">重置</button>-->
        <#--</div>-->
    <#--</div>-->
<#--</form>-->

        <div class="layui-tab">
            <ul class="layui-tab-title">
                <li class="layui-this">用户基本信息</li>
                <li>账户信息</li>
                <li>消费记录</li>
                <li>收货地址信息</li>

            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item layui-show">
                    <table class="layui-table" border="0">
                        <colgroup>
                            <col width="50px">
                            <col width="50px">
                            <col width="50px">
                            <col width="50px">
                            <col width="50px">
                        </colgroup>
                        <tbody>
                        <input hidden type="text" value="10001" name="userid">
                        <tr>
                            <td>会员编号</td>
                            <td>10001</td>
                            <td></td>
                            <td>会员账号</td>
                            <td>wjhhh</td>
                        </tr>

                        <tr>
                            <td>会员账号</td>
                            <td>wjhhh</td>
                            <td></td>
                            <td>会员类型</td>
                            <td>wjhhh</td>
                        </tr>

                        <tr>
                            <td>会员生日</td>
                            <td>wjhhh</td>
                            <td></td>
                            <td>消费金额</td>
                            <td>wjhhh</td>
                        </tr>
                        <tr>
                            <td>真实姓名</td>
                            <td>wjhhh</td>
                            <td></td>
                            <td>注册日期</td>
                            <td>wjhhh</td>
                        </tr><tr>

                        </tr>
                        <tr>
                            <td>账户积分</td>
                            <td>wjhhh</td>
                            <td></td>
                            <td>会员等级</td>
                            <td>wjhhh</td>
                        </tr>

                        <tr>
                            <td>邮箱</td>
                            <td>wjhhh</td>
                            <td></td>
                            <td>主收货地址ID</td>
                            <td>wjhhh</td>
                        </tr>

                        <tr>
                            <td>电话一</td>
                            <td>wjhhh</td>
                            <td></td>
                            <td>电话二</td>
                            <td>wjhhh</td>
                        </tr>


                        </tbody>
                    </table>
                </div>
                <div class="layui-tab-item">
                    <table class="layui-table" border="0">
                        <colgroup>
                            <col width="50px">
                            <col width="50px">
                            <col width="50px">
                            <col width="100px">
                            <col width="50px">
                            <col width="50px">
                            <col width="50px">
                            <col width="50px">
                            <col width="50px">
                            <col width="50px">
                        </colgroup>
                        <thead>
                        <tr>
                            <#--<th><input name="" lay-skin="primary" lay-filter="allChoose" type="checkbox"></th>-->
                            <th>会员编号</th>
                            <th>会员账号</th>
                            <th>银行卡号</th>
                            <th>银行名称</th>
                            <th>开户行</th>
                            <th>是否可用</th>
                            <th>创建人</th>
                            <th>创建时间</th>
                            <th>修改人</th>
                            <th>修改时间</th>
                        </tr>
                        </thead>
                        <tbody>
                        <input hidden type="text" value="10001" name="userid">
                        <tr>
                            <td>10001</td>
                            <td>wjhhh</td>
                            <td>35434534</td>
                            <td>中国建设很行</td>
                            <td>郑州</td>
                            <td>可用</td>
                            <td>王军会</td>
                            <td>2017</td>
                            <td>王军会</td>
                            <td>2017</td>
                        </tr>



                        </tbody>
                    </table>
                </div>
                <div class="layui-tab-item">
                    <table class="layui-table" border="0">
                        <colgroup>
                            <col width="50px">
                            <col width="100px">
                            <col width="100px">
                            <col width="100px">
                            <col width="50px">

                        </colgroup>
                        <thead>
                        <tr>
                        <#--<th><input name="" lay-skin="primary" lay-filter="allChoose" type="checkbox"></th>-->
                            <th>会员编号</th>
                            <th>订单编号</th>
                            <th>代金券编号</th>
                            <th>使用积分数量</th>
                            <th>消费时间</th>

                        </tr>
                        </thead>
                        <tbody>
                        <input hidden type="text" value="10001" name="userid">
                        <tr>
                            <td>10001</td>
                            <td>a100720170919</td>
                            <td>d7985172</td>
                            <td>100</td>
                            <td>20170919</td>

                        </tr>



                        </tbody>
                    </table>
                </div>
                <div class="layui-tab-item">
                    <table class="layui-table" border="0">
                        <colgroup>
                            <col width="50px">
                            <col width="50px">
                            <col width="50px">
                            <col width="100px">
                            <col width="50px">
                            <col width="50px">
                            <col width="50px">
                            <col width="50px">
                            <col width="50px">
                            <col width="50px">
                        </colgroup>
                        <thead>
                        <tr>
                        <#--<th><input name="" lay-skin="primary" lay-filter="allChoose" type="checkbox"></th>-->
                            <th>会员编号</th>
                            <th>省份</th>
                            <th>市</th>
                            <th>详细地址</th>
                            <th>是否是主地址</th>
                            <th>是否可用</th>
                            <th>创建时间</th>
                            <th>创建人</th>
                            <th>修改时间</th>
                            <th>修改人</th>
                        </tr>
                        </thead>
                        <tbody>
                        <input hidden type="text" value="10001" name="userid">
                        <tr>
                            <td>10001</td>
                            <td>wjhhh</td>
                            <td>35434534</td>
                            <td>中国建设很行</td>
                            <td>郑州</td>
                            <td>可用</td>
                            <td>王军会</td>
                            <td>2017</td>
                            <td>王军会</td>
                            <td>2017</td>
                        </tr>



                        </tbody>
                    </table>
                </div>

            </div>
        </div>


<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>当前商品信息</legend>
</fieldset>

<div class="layui-form">
    <table class="layui-table">
        <colgroup>
            <col width="50">


            <col width="100">
            <col width="200">
            <col width="200">
            <col width="50">
            <col width="50">
            <col>
        </colgroup>
        <thead>
        <tr>

            <th>商品明细编号</th>
            <th>明细名称</th>
            <th>销售价格</th>
            <th>当前库存数量</th>
            <th>选择数量</th>
            <th>选择商品</th>

        </tr>
        </thead>


            <tbody>
            <#list prduct as item>

            <tr>
                <td>${item.prd_dtl_id}</td>
                <td>${item.prd_dtl_name}</td>
                <td>${item.sale_price}</td>
                <td>${item.totalcount}</td>
                <td><input type="number" name="num" min="1" max="10" /></td>

                <td> <input type="checkbox" name="prd_dtl_id" value="${item.prd_dtl_id}" ></td>

            </tr>

            </#list>
            </tbody>

    </table>
    <div class="layui-input-inline">
        <button class="layui-btn" lay-submit >确认订单</button>

    </div>

</div></form>
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

        // 分页
        laypage({
            cont : 'form_page', // 页面上的id
            pages : ptotalpages,//总页数
            curr : pindex,//当前页。
            skip : true,
            jump : function(obj, first) {
                $("#currentPage").val(obj.curr);//设置当前页
                //$("#size").val(psize);
                //防止无限刷新,
                //只有监听到的页面index 和当前页不一样是才出发分页查询
                if (obj.curr != pindex ) {
                    $("#pageSubmit").submit();
                }
            }
        });

        //监听修改事件
        $(".manageMenu").on("click",function(){
            var id = $(this).attr("val");
            layer.open({
                title: '管理菜单 - 惠买ivalue管理系统'
                ,area: ['400px', '500px']
                ,type: 2 //content内容为一个连接
                ,content: '/menu/updateMenu.do?id=' + id
            });
        });

        //带回页面的select参数进行动态赋值
        var pId = "";

        var isUsed= "";

        // 菜单级别动态赋值
        if(pId == '0') {
            $("#pId").find("option[value = '0']").attr("selected","selected");
        } else if(pId == '1') {
            $("#pId").find("option[value = '1']").attr("selected","selected");
        }

        // 是否使用动态赋值
        if(isUsed == 'y') {
            $("#isUsed").find("option[value = 'y']").attr("selected","selected");
        } else if(isUsed == 'n') {
            $("#isUsed").find("option[value = 'n']").attr("selected","selected");
        }
        // 重新渲染页面
        form.render();
    });
</script>
</body>
</html>