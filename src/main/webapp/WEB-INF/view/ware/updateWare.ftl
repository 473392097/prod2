<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/resources/layui/css/layui.css">
</head>
<body>
<fieldset class="layui-elem-field" >
    <legend>仓储修改</legend>
<div class="layui-field-box" >
    <form class="layui-form">
        <!-- id作为隐藏域-->
        <input type="hidden" name="id" value="${result.id}">
        <div class="layui-form-item">
            <label class="layui-form-label">仓储编号</label>
            <div class="layui-input-block">
                <input type="text" id="wareNo" name="wareNo" value="${result.w_no}" required  lay-verify="required" placeholder="请输入菜单名称" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">仓储名称</label>
            <div class="layui-input-block">
                <input type="text" id="wareName" name="wareName" value="${result.w_name}" required  lay-verify="required" placeholder="请输入菜单名称" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">仓储地址</label>
            <div class="layui-input-block">
                <input type="text" id="wareAddr" name="wareAddr" value="${result.w_addr}" required  lay-verify="required" placeholder="请输入菜单名称" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">是否使用</label>
            <div class="layui-input-block">
                <input type="radio" name="isUsed" value="y" title="启用" checked>
                <input type="radio" name="isUsed" value="n" title="禁用" >
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">仓储类型</label>
            <div class="layui-input-block">
                <select lay-filter="wareType" id="wareType" name="wareType" >
                    <option value="10" >所有</option>
                    <option value="20" >水果</option>
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="updateWareForm">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
</fieldset>
<script type="text/javascript" src="/resources/layui/layui.js"></script>
<script>
    layui.use(['form','jquery','layer'], function(){
        var $ = layui.jquery;
        var form = layui.form();
        var layer = layui.layer;

        //监听提交
        form.on('submit(updateWareForm)', function(params){
            var data = $("form").serializeArray();
            $.ajax({
                type: "POST",
                url: "/ware/updateWareForm.do",  //后台程序地址
                data: data,  //需要post的数据
                success: function(data){           //后台程序返回的标签，比如我喜欢使用1和0 表示成功或者失败
                    if (data.result == 'success'){   //如果成功了, 则关闭当前layer
                        layer.msg('修改成功',{
                            icon: 1,
                            time: 1000 //1秒关闭（如果不配置，默认是3秒）
                    },function(){//
                            //注册成功后，自动关闭当前注册页面
                            //先得到当前iframe层的索引
                            var index = parent.layer.getFrameIndex(window.name);
                            parent.layer.close(index);
                        });
                    }
                }
            });
            return false;//return false 表示不通过页面刷新方式提交表单
        });

    // 菜单级别动态赋值
        var wareType="${result.w_type!''}"
    if(wareType == '10') {
        $("#wareType").find("option[value = '10']").attr("selected","selected");
        $("#wareType").find("option[value = '20']").remove("selected");
    } else if(wareType != '10') {
        $("#wareType").find("option[value = '20']").attr("selected","selected");
        $("#wareType").find("option[value = '10']").remove("selected");
    }

    var isUsed="${result.is_used!''}"
        if(isUsed == 'y') {
            $("input[name='isUsed']:eq(0)").attr("checked",'checked');
        } else if(isUsed == 'n') {
            $("input[name='isUsed']:eq(1)").attr("checked",'checked');
        }
    // 重新渲染页面
    form.render();
    });
</script>
</body>
</html>