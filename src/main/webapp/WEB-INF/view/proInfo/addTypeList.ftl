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
<fieldset class="layui-elem-field" >
    <legend>类型信息添加</legend>
    <div class="layui-field-box" >
        <form class="layui-form">
            <div class="layui-form-item">
                <label class="layui-form-label">类别编号</label>
                <div class="layui-input-inline">
                    <input type="text" id="tpCd" name="tpCd" required  lay-verify="required" placeholder="请输入类别编号" autocomplete="off" class="layui-input">
                </div>
                <label class="layui-form-label">类别名称</label>
                <div class="layui-input-inline">
                    <input type="text" id="tpName" name="tpName" required  lay-verify="required" placeholder="请输入类别名称" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                    <label class="layui-form-label">是否使用</label>
                    <div class="layui-input-inline">
                        <input type="radio" name="isUsed" value="y" title="使用" checked>
                        <input type="radio" name="isUsed" value="n" title="禁用" >
                    </div>
                <label class="layui-form-label">创建时间</label>
                <div class="layui-input-inline" >
                    <input id="instDate" name="instDate" type="date"  placeholder="创建时间" onclick="layui.laydate({elem: this})">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="addType">立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
</fieldset>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>类型信息</legend>
</fieldset>
<div class="layui-form">
    <table class="layui-table">
        <colgroup>
            <col width="50">
            <col width="50">
            <col width="100">
            <col width="50">
            <col width="50">
            <col width="50">


        </colgroup>
        <thead>
        <tr>
            <th>ID</th>
            <th>类别编号</th>
            <th>类别名称</th>
            <th>是否使用</th>
            <th>创建时间</th>
            <th>修改</th>
        </tr>
        </thead>
        <tbody>
            <#list list as item>
            <tr>
                <td>${item.id}</td>
                <td>${item.tp_cd}</td>
                <td>${item.tp_name}</td>
                <td>
                    <#if item.is_used=='y'>使用
                    <#else>禁用
                    </#if>
                </td>
                <td>${item.inst_date}</td>
            <td>
                <button val="${item.id}" class="manageType layui-btn layui-btn-normal layui-btn-small"><i class="layui-icon"></i></button>
            </td>
            </tr>
            </#list>
        </tbody>
    </table>
</div>

<div class="layui-form">
    <span id="form_page"></span>&nbsp;共${page.total}条数据
</div>
<form id="pageSubmit">
    <input type="hidden" id="currentPage" name="currentPage" >
</form>
<script type="text/javascript" src="/resources/layui/layui.js"></script>
<script type="text/javascript">
    layui.define([ 'element', 'form', 'layer', 'laypage','laydate'], function(exports) {
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
                //$("#size").val(psize);
                //防止无限刷新,
                //只有监听到的页面index 和当前页不一样是才出发分页查询
                if (obj.curr != pindex ) {
                    $("#pageSubmit").submit();
                }
            }
        });
        //监听添加事件
        form.on('submit(addType)', function(params){
            var data = $("form").serializeArray();
            $.ajax({
                type: "POST",
                url: "/prd/addTypeForm.do",  //后台程序地址
                data: data,  //需要post的数据
                success: function(data){           //后台程序返回的标签，比如我喜欢使用1和0 表示成功或者失败
                    if (data.result == 'success'){   //如果成功了, 则关闭当前layer
                        layer.msg('添加成功',{
                            icon: 1,
                            time: 1000 //1秒关闭（如果不配置，默认是3秒）
                        },function(){//
                            //do something
                            //注册成功后，自动关闭当前注册页面
                            //先得到当前iframe层的索引
                            var index = parent.layer.getFrameIndex(window.name);
                            parent.layer.close(index);
                            //parent.layer.closeAll("iframe");
                        });
                    }else if(data.result=='failuer'){
                        layer.msg('添加失败')
                    }
                }
            });
            return false;//return false 表示不通过页面刷新方式提交表单
        });

        //监听修改事件
        $(".manageType").on("click",function(){

            var id = $(this).attr("val");

            layer.open({

                title: '管理菜单 - 惠买ivalue管理系统'
                ,area: ['400px', '500px']
                ,type: 2 //content内容为一个连接
                ,content: '/prd/updateType.do?id=' + id
            });
        });

    });
</script>
</body>
</html>