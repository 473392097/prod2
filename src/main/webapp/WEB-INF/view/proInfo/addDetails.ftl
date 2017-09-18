<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/resources/layui/css/layui.css">
</head>
<body>
<fieldset class="layui-elem-field">
    <legend>添加mingxi</legend>
    <div class="layui-field-box">
        <form class="layui-form">


            <div class="layui-form-item">

                <label class="layui-form-label">商品id</label>
                <div class="layui-input-inline">
                    <input type="text"  name="prd_id" value="#{prdNo}" class="layui-input">
                </div>

            </div>

            <div class="layui-form-item">

                <label class="layui-form-label">明细商品名称</label>
                <div class="layui-input-inline">
                    <input type="text" name="prd_dtl_name" lay-verify="require" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">

                <label class="layui-form-label">明细商品图片</label>
                <div class="layui-input-inline">
                    <input type="file" name="file" class="layui-upload-file">
                </div>

            </div>

            <div class="layui-form-item">

                <label class="layui-form-label">明细商品成本</label>
                <div class="layui-input-inline">
                    <input type="text" name="source_price" lay-verify="require" autocomplete="off" class="layui-input">
                </div>

            </div>

            <div class="layui-form-item">

                <label class="layui-form-label">明细商品售价</label>
                <div class="layui-input-inline">
                    <input type="text" name="sale_price" lay-verify="require" autocomplete="off" class="layui-input">
                </div>

            </div>

            <div id="InputsWrapper">
                <div class="layui-form-item">
                    <label class="layui-form-label">仓库位置</label>
                    <div class="layui-input-inline">
                        <select id="w_no" name="w_no">

                        <#list ware as item>
                            <option value="${item.w_no}">${item.w_name}</option>
                        </#list>
                        </select>
                    </div>
                    <label class="layui-form-label">库存数量</label>
                    <div class="layui-input-inline">
                        <input type="text" name="w_count" lay-verify="require" autocomplete="off" class="layui-input">
                    </div>
                    <a href="#"
                       class="removeclass">×</a>
                </div>


            </div>


            <div class="layui-form-item">

                <label class="layui-form-label">是否使用</label>
                <div class="layui-input-inline">
                    <input type="radio" name="is_used" value="y" title="是" checked>
                    <input type="radio" name="is_used" value="n" title="否">
                </div>


            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="addMenuForm">提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
</fieldset>


<script type="text/javascript" src="/resources/layui/layui.js"></script>
<script>


    layui.use(['form', 'jquery', 'layer', 'upload', 'laydate'], function () {

        var $ = layui.jquery;
        var form = layui.form();
        var layer = layui.layer;
        var laydate = layui.laydate;

        //头像上传
        layui.upload({
            url: '/prd/upload.do'
            , method: 'post' //上传接口的http类型
            ,ext:'jpg|png|gif|jpeg'
            , success: function (res) {
                layer.msg("上传成功");
                //LAY_demo_upload.src = res.url;
            }
        });


        //监听提交
        form.on('submit(addMenuForm)', function (params) {
            var data = $("form").serializeArray();
            $.ajax({
                type: "POST",
                url: "/prd/addProDetail.do",  //后台程序地址
                data: data,  //需要post的数据
                success: function (data) {           //后台程序返回的标签，比如我喜欢使用1和0 表示成功或者失败
                    if (data.result == 'success') {   //如果成功了, 则关闭当前layer
                        layer.msg('添加成功', {
                            icon: 1,
                            time: 1000 //1秒关闭（如果不配置，默认是3秒）
                        }, function () {//
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
    });
</script>
</body>
</html>
