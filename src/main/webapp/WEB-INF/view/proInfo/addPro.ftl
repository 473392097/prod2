<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/resources/layui/css/layui.css">
</head>
<body>
<fieldset class="layui-elem-field" >
    <legend>添加菜单</legend>
    <div class="layui-field-box" >
        <form class="layui-form">


            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">商品名称</label>
                    <div class="layui-input-inline">
                        <input type="text" name="prdName" lay-verify="require" autocomplete="off" class="layui-input">
                    </div>


                    <label class="layui-form-label">明细商品图片</label>
                    <div class="layui-input-inline">
                        <input type="file" name="imgUrl" class="layui-upload-file">
                    </div>


                    <label class="layui-form-label">添加活动</label>
                    <div class="layui-input-inline">
                        <input type="radio" name="isSales" value="y" title="是" checked>
                        <input type="radio" name="isSales" value="n" title="否" >
                    </div>


                </div>

            </div>





            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">商品简码</label>
                    <div class="layui-input-inline">
                        <input type="text" name="prdCode" lay-verify="require" autocomplete="off" class="layui-input">
                    </div>

                    <label class="layui-form-label">捆绑销售</label>
                    <div class="layui-input-inline">
                        <input type="radio" name="isGifts" value="y" title="是" checked>
                        <input type="radio" name="isGifts" value="n" title="否" >
                    </div>

                    <#--<label class="layui-form-label">销售方式</label>-->
                    <#--<div class="layui-input-inline">-->
                        <#--<select id="pId" name="saleCode" >-->
                            <#--<option value="0">一级</option>-->
                            <#--<option value="1">二级</option>-->
                        <#--</select>-->
                    <#--</div>-->


                </div>

            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">商品类别</label>
                <div class="layui-input-inline">
                    <select id="pId" name="supId" >
                    <#list proType as item>
                        <option value="${item.tpName}">${item.tpName} </option>
                    </#list>
                    </select>
                </div>

               <div>
                    <label class="layui-form-label">可预售</label>
                    <div class="layui-input-block">
                        <input type="radio" name="isUsed" value="y" title="是" checked>
                        <input type="radio" name="isUsed" value="n" title="否" >
                    </div>
                </div>
            </div>



            <div class="layui-form-item">
                <label class="layui-form-label">上架时间</label>
                <div class="layui-input-inline">
                    <input type="text" name="shDate" lay-verify="require" autocomplete="off" class="layui-input">
                </div>

                    <label class="layui-form-label">退换货</label>
                    <div class="layui-input-block">
                        <input type="radio" name="isReturn" value="y" title="是" checked>
                        <input type="radio" name="isReturn" value="n" title="否" >
                    </div>

            </div>







            <div class="layui-form-item">
                <label class="layui-form-label">售卖形式</label>
                <div class="layui-input-inline">
                    <select id="pId" name="saleCode" >
                        <option value="0">网站</option>
                        <option value="1">线上</option>
                    </select>
                </div>


                  <div>
                    <label class="layui-form-label">是否使用</label>
                    <div class="layui-input-block">
                        <input type="radio" name="isUsed" value="y" title="是" checked>
                        <input type="radio" name="isUsed" value="n" title="否" >
                    </div>
                </div>
            </div>



            <label class="layui-form-label">供应商</label>
            <div class="layui-input-inline">
                <select id="pId" name="supId" >
                    <option value="0">康师傅</option>
                    <option value="1">康帅府</option>
                </select>
            </div>

            </br>
            </br>
            </br>
            </br>

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
    //Demo
    // 待学生自主完成
    layui.use(['form','jquery','layer','upload'], function(){
        var $ = layui.jquery;
        var form = layui.form();
        var layer = layui.layer;

//
//        $.ajax({
//            type: "POST",
////            url: "/menu/getAllParentNodeInfo.do",  //后台程序地址
//            //data: data,  //需要post的数据
//            success: function(result){
//                alert(result)
//                for(var i=0; i<result.length;i++){
//                        $("#prdType").append("<option value=\""+result[i].id+"\" selected>"+result[i].name+"</option>");
//                }
//                form.render();
//            }
//        });



















        form.on("select(menuLevel)",function (data) {
            // 获取一级菜单个数，初始化只有1个
            var parentMenu = $("#pId option").length;
            // 选择二级菜单并且是第一次时才会发送请求
//            if(data.value == '1') {
//                $("#switch").removeAttr("style");
//                $("#pId").removeAttr("disabled");
//                if(parentMenu < 2) {
//                    $("#pId").attr("lay-verify","required");
//                    $.ajax({
//                        type: "POST",
//                        url: "/menu/getAllParentNodeInfo.do",  //后台程序地址
//                        //data: data,  //需要post的数据
//                        success: function(result){           //后台程序返回的标签，比如我喜欢使用1和0 表示成功或者失败
//                            for(var i=0; i<result.length;i++){
//                                if(i == 0) {
//                                    $("#pId").append("<option value=\""+result[i].id+"\" selected>"+result[i].name+"</option>");
//                                } else {
//                                    $("#pId").append("<option value=\""+result[i].id+"\">"+result[i].name+"</option>");
//
//                                }
//                            }
//                            form.render();
//                        }
//                    });
//                }
//            } else {
//                $("#pId").removeAttr("lay-verify");
//                $("#pId").attr("disabled","disabled");
//                $("#switch").attr("style","display:none");
//            }
//            form.render();
        });


        //头像上传
        layui.upload({
            url: '/user/upload.do'
            ,method: 'post' //上传接口的http类型
            ,success: function(res){
                layer.msg("上传成功");
                //LAY_demo_upload.src = res.url;
            }
        });






        //监听提交
        form.on('submit(addMenuForm)', function(params){
            var data = $("form").serializeArray();
            $.ajax({
                type: "POST",
                url: "/menu/addMenuForm.do",  //后台程序地址
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
    });
</script>
</body>
</html>