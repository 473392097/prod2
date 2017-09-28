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


<label class="layui-form-label"> </label>
<form class="layui-form"  id="pageSubmit">
    <div class="layui-form-item">
        <label class="layui-form-label">供应商名称</label>
        <div class="layui-input-block">
            <input type="text" id="name" name="supName"      placeholder="请输入供应商名字" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">注册公司</label>
        <div class="layui-input-block">
            <input type="text" id="url" name="supComp"     placeholder="请输入注册公司名字" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">所在地</label>
        <div class="layui-input-block">
            <input type="text" id="url" name="supAddr"     placeholder="请输入所在地" autocomplete="off" class="layui-input">
        </div>
    </div>




    <div class="layui-form-item">
        <div class="layui-input-block">
            <button  id="layui-btn"  class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>


    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">

        <legend>所有用户</legend>
    </fieldset>
    <div class="layui-form">

        <table class="layui-table">
            <colgroup>
                <col width="50">
                <col width="100">
                <col width="80">
                <col width="120">
                <col width="80">
                <col width="80">
                <col width="80">
                <col>
            </colgroup>
            <thead>
            <tr>
                <th>ID</th>
                <th>供应商名称</th>
                <th>注册公司</th>
                <th>所在地</th>
                <th>供应商等级</th>
                <th>编辑</th>

            </tr>
            </thead>
            <tbody>
            <#list list as item>

            <tr>
                <td>${item.id}</td>
                <td>${item.sup_name}</td>
                <td>${item.sup_comp}</td>
                <td>${item.sup_addr}</td>
                <td>${item.sup_level}</td>
                <td>
                    <div class="layui-btn-group">

                        <button type="button" value="${item.id}"  class="layui-btn layui-btn-small mybutton">
                        <i class="layui-icon">&#xe642;</i>
                        </button>

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





    <input type="hidden" id="currentPage"  name="currentPage" >
</form>




<script type="text/javascript" src="/resources/layui/layui.js"></script>
<script type="text/javascript">

    layui.define([ 'element', 'form','jquery', 'layer', 'laypage'], function(exports) {
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

        // 监听注册按钮
        form.on('submit(formDemo)', function(data){
//            layer.msg(JSON.stringify(data.field));
            $.ajax({
                url: "/sup/getSupList.do",  //后台程序地址
                type: "POST",
                data: data.field,  //需要post的数据
                success:function (data) {
                }

            });

        });



        // 个人信息弹出窗
        $(".mybutton").on("click",function(){
            var id =this.value
            layer.open({
                title: '详情 - 惠买ivalue管理系统'
                ,area: ['500px', '400px']
                ,type: 2 //content内容为一个连接
                ,content: '/sup/tan.do?id=' + id
            });
        })








    });
</script>
</body>
</html>