<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/resources/layui/css/layui.css">
</head>
<body>
<fieldset class="layui-elem-field" >
    <legend>类型信息修改</legend>
    <div class="layui-field-box" >
        <form class="layui-form">
            <!-- id作为隐藏域-->
            <input type="hidden" name="id" value="${result.id}">
            <div class="layui-form-item">
            <div class="layui-form-item">
                <label class="layui-form-label">类别编号</label>
                <div class="layui-input-inline">
                    <input type="text" id="tpCd" name="tpCd" value="${result.tp_cd}" required  lay-verify="required" placeholder="请输入类别编号" autocomplete="off" class="layui-input">
                </div>
                <label class="layui-form-label">类别名称</label>
                <div class="layui-input-inline">
                    <input type="text" id="tpName" name="tpName" value="${result.tp_name}" required  lay-verify="required" placeholder="请输入类别名称" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">是否使用</label>
                <div class="layui-input-inline">
                    <input type="radio" name="isUsed" value="y" title="使用" checked>
                    <input type="radio" name="isUsed" value="n" title="禁用" >
                </div>
            </div>
                <label class="layui-form-label">创建时间</label>
                <div class="layui-input-inline" >
                    <input id="instDate" name="instDate" type="date" value="${result.inst_date}" placeholder="创建时间" onclick="layui.laydate({elem: this})">
                </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="updateTypeForm">立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
</fieldset>
<script type="text/javascript" src="/resources/layui/layui.js"></script>
<script>
    layui.use(['form','jquery','layer','laydate'], function(){
        var $ = layui.jquery;
        var form = layui.form();
        var layer = layui.layer;
        var laydate = layui.laydate;
        //监听提交
        form.on('submit(updateTypeForm)', function(params){
            var data = $("form").serializeArray();
            $.ajax({
                type: "POST",
                url: "/prd/updateTypeForm.do",  //后台程序地址
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
                    }else if(data.result=='faile'){
                        layer.msg('修改失败')
                    }
                }
            });
            return false;//return false 表示不通过页面刷新方式提交表单
        });

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