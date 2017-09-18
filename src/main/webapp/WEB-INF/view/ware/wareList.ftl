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
    <legend>仓储添加</legend>
    <div class="layui-field-box" >
        <form class="layui-form">
            <!-- id作为隐藏域-->
            <#--<input type="hidden" name="id" value="${result.id}">-->
            <div class="layui-form-item">
                <label class="layui-form-label">仓储编号</label>
                <div class="layui-input-inline">
                    <input type="text" id="wareNo" name="wareNo" required  lay-verify="required" placeholder="请输入仓储编号" autocomplete="off" class="layui-input">
                </div>
                <label class="layui-form-label">仓储名称</label>
                <div class="layui-input-inline">
                    <input type="text" id="wareName" name="wareName" required  lay-verify="required" placeholder="请输入仓储名称" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">仓储地址</label>
                <div class="layui-input-inline">
                    <input type="text" id="wareAddr" name="wareAddr" required  lay-verify="required" placeholder="请输入仓储地址" autocomplete="off" class="layui-input">
                </div>
                <label class="layui-form-label">仓储类型</label>
                <div class="layui-input-inline">
                    <select lay-filter="wareType" id="wareType" name="wareType" >
                        <option value="10" >所有</option>
                        <option value="20" >水果</option>
                    </select>
                </div>
            </div>

            <div class="layui-form-item" >
                <label class="layui-form-label">是否使用</label>
                <div class="layui-input-inline">
                    <input type="radio" name="isUsed" value="y" title="使用" checked>
                    <input type="radio" name="isUsed" value="n" title="禁用" >
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="addWare">立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
</fieldset>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>仓储信息</legend>
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
            <col width="50">

        </colgroup>
        <thead>
        <tr>
            <th>ID</th>
            <th>仓储编号</th>
            <th>仓储名称</th>
            <th>仓储地址</th>
            <th>是否可用</th>
            <th>仓储类别</th>
            <th>修改</th>
        </tr>
        </thead>
        <tbody>
            <#list list as item>
            <tr>
                <td>${item.id}</td>
                <td>${item.w_no}</td>
                <td>${item.w_name}</td>
                <td>${item.w_addr}</td>
                <td>
                    <#if item.is_used=='y'>使用
                    <#else>禁用
                    </#if>
                </td>
                <td>
                    <#if item.w_type=='10'>所有
                    <#else>水果
                    </#if>
                </td>
            <td>
                <button val="${item.id}" class="manageWare layui-btn layui-btn-normal layui-btn-small"><i class="layui-icon"></i></button>
            </td>
            </tr>
            </#list>
        </tbody>
    </table>
</div>

<script type="text/javascript" src="/resources/layui/layui.js"></script>
<script type="text/javascript">
    layui.define([ 'element', 'form', 'layer', 'laypage'], function(exports) {
        var element = layui.element();
        var form = layui.form();
        var layer = layui.layer;
        var laypage = layui.laypage;
        var $ = layui.jquery;


        form.on('submit(addWare)', function(params){
            var data = $("form").serializeArray();
            $.ajax({
                type: "POST",
                url: "/ware/addWareForm.do",  //后台程序地址
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
                    }
                }
            });
            return false;//return false 表示不通过页面刷新方式提交表单
        });

        //监听修改事件
        $(".manageWare").on("click",function(){

            var id = $(this).attr("val");

            layer.open({

                title: '管理菜单 - 惠买ivalue管理系统'
                ,area: ['400px', '500px']
                ,type: 2 //content内容为一个连接
                ,content: '/ware/updateWare.do?id=' + id
            });
        });

    });
</script>
</body>
</html>