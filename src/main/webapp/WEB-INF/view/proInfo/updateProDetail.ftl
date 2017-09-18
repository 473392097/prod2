<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/resources/layui/css/layui.css">
</head>
<body>
<fieldset class="layui-elem-field">
    <legend>商品明细修改</legend>
    <div class="layui-field-box">
        <form class="layui-form">
            <!-- id作为隐藏域 明细编号-->
            <#--<input  name="prd_dtl_id" value="${onedetail.prd_dtl_id}">-->
            <div class="layui-form-item">
                <label class="layui-form-label">明细名称</label>
                <div class="layui-input-block">
                    <input type="text" id="name" name="prd_dtl_name" value="${onedetail.prd_dtl_name! ''}" required
                           lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">图片</label>
                <div class="layui-input-inline">
                    <input type="text" id="url" name="img_url" value="${onedetail.img_url! ''}" required
                           lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">销售价格</label>
                <div class="layui-input-inline">
                    <input type="text" id="url" name="sale_price" value="${onedetail.sale_price! ''}" required
                           lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="updateProDetail">立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
</fieldset>
<script type="text/javascript" src="/resources/layui/layui.js"></script>
<script>
    layui.use(['form', 'jquery', 'layer'], function () {
        var $ = layui.jquery;
        var form = layui.form();
        var layer = layui.layer;

        // 监听select事件
        form.on("select(menuLevel)", function (data) {
            // 获取一级菜单个数，初始化只有1个
//            var firstMenuSize = $("#pId option").length;
            // 选择二级菜单并且是第一次时才会发送请求
            if (data.value == '1') {
                // 控制显示select
                $("#switch").removeAttr("style");
                // 设置disabled属性为了提交form的时候不再将这个select数据传输到后台
                $("#pId").removeAttr("disabled");
                // 添加必填验证
                $("#pId").attr("lay-verify", "required");
                form.render();
                if (firstMenuSize < 2) {
                    $.ajax({
                        type: "POST",
                        url: "/prd/getUpdatePage.do",  //后台程序地址
                        //data: data,  //需要post的数据
                        success: function (result) {           //后台程序返回的标签，比如我喜欢使用1和0 表示成功或者失败
                            for (var i = 0; i < result.length; i++) {
                                if (i == 0) {
                                    $("#pId").append("<option value=\"" + result[i].id + "\" selected>" + result[i].name + "</option>");
                                } else {
                                    $("#pId").append("<option value=\"" + result[i].id + "\">" + result[i].name + "</option>");

                                }
                            }
                            form.render();
                        }
                    });
                }
            } else {
                $("#pId").removeAttr("lay-verify");
                $("#pId").attr("disabled", "disabled");
                $("#switch").attr("style", "display:none");
                form.render();
            }
        });

        //监听提交
        form.on('submit(updateProDetail)', function (params) {
            var data = $("form").serializeArray();
            $.ajax({
                type: "POST",
                url: "/prd/updateProDetail.do",  //后台程序地址
                data: data,  //需要post的数据
                success: function (data) {           //后台程序返回的标签，比如我喜欢使用1和0 表示成功或者失败
                    if (data.result == 'success') {   //如果成功了, 则关闭当前layer
                        layer.msg('修改成功', {
                            icon: 1,
                            time: 1000 //1秒关闭（如果不配置，默认是3秒）
                        }, function () {//
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

        //带回页面的select参数进行动态赋值
    <#--var pId = "${result.pId!''}";-->
    <#--var isUsed= "${result.isUsed!''}";-->

        var isused = "${onedetail.is_used!''}";
//        // 是否使用动态赋值
        if (isused == 'y') {
            $("input[name='isUsed']:eq(0)").attr("checked", 'checked');
        } else if (isused == 'n') {
            $("input[name='isUsed']:eq(1)").attr("checked", 'checked');
        }
        // 重新渲染页面
        form.render();
    });
</script>
</body>
</html>