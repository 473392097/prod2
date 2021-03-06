<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/resources/layui/css/layui.css">
</head>
<body>
<fieldset class="layui-elem-field">
    <legend>添加菜单</legend>
    <div class="layui-field-box">
        <form class="layui-form">


            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">商品名称</label>
                    <div class="layui-input-inline">
                        <input type="text" name="prdName" lay-verify="require" autocomplete="off" class="layui-input">
                    </div>



                    <label class="layui-form-label">头像</label>
                    <div class="layui-input-inline">
                        <input type="file" id="file" name="file" class="layui-upload-file">
                    </div>

                    <#--<div class="layui-input-block">-->
                        <#--<input type="file" id="file" name="file" class="layui-upload-file">-->
                    <#--</div>-->

                    <label class="layui-form-label">添加活动</label>
                    <div class="layui-input-inline" >
                        <input type="radio" name="isSales" value="y" title="是" checked>
                        <input type="radio" name="isSales" value="n" title="否">
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
                        <input type="radio" name="isGifts" value="n" title="否">
                    </div>
                </div>

            </div>





            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">商品类别</label>
                    <div class="layui-input-inline">
                        <select id="pId" name="prdType">
                        <#list proType as item>
                            <option value="${item.id}">${item.tp_name}</option>
                        </#list>
                        </select>
                    </div>
                    <label class="layui-form-label">退换货</label>
                    <div class="layui-input-inline">
                        <input type="radio" name="isReturn" value="y" title="是" checked>
                        <input type="radio" name="isReturn" value="n" title="否">
                    </div>
                </div>
            </div>




            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">上架时间</label>
                    <div class="layui-input-inline">
                        <input name="shDate"   class="layui-input" placeholder="上架时间" onclick="layui.laydate({elem: this})">
                    </div>

                </div>
            </div>



            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">售卖方式</label>
                    <div class="layui-input-inline">
                        <select id="pId" name="saleCode">
                            <option>请选择</option>
                            <option value="100" >热线</option>
                            <option value="200" >网上</option>
                            <option value="300" >手机</option>

                        <#--<#list proInfo as item>-->
                            <#--<#if  item.sale_code=='100'><option >热线</option>-->
                            <#--<#elseif item.sale_code=='200'><option>网上</option>-->
                            <#--<#elseif item.sale_code=='300'><option>手机</option>-->
                            <#--</#if>-->
                            <#--&lt;#&ndash;<option value="${item.sale_code}">${item.sale_code}</option>&ndash;&gt;-->
                        <#--</#list>-->

                        </select>
                    </div>

                    <label class="layui-form-label">是否可用</label>
                    <div class="layui-input-inline">
                        <input type="radio" name="isUsed" value="y" title="是" checked>
                        <input type="radio" name="isUsed" value="n" title="否">
                    </div>
                </div>
            </div>


            <label class="layui-form-label">供应商</label>
            <div class="layui-input-inline">
                <select id="pId" name="supId">
                <#list supplier as item>
                    <option value="${item.id}">${item.sup_name}</option>
                </#list>
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
    layui.use(['form', 'jquery', 'layer', 'upload','laydate'], function () {
        var $ = layui.jquery;
        var form = layui.form();
        var layer = layui.layer;
        var laydate = layui.laydate;




        //监听提交
        form.on('submit(addMenuForm)', function (params) {
            var data = $("form").serializeArray();
            $.ajax({
                type: "POST",
                url: "/prd/addProInfo.do",  //后台程序地址
                data: data,  //需要post的数据
                success: function (data) {
                    //后台程序返回的标签，比如我喜欢使用1和0 表示成功或者失败
                    console.log(data)
                    if (data.result == 'success') {   //如果成功了, 则关闭当前layer
                        layer.msg('添加成功', {
                            icon: 1,
                            time: 1000 //1秒关闭（如果不配置，默认是3秒）
                        }, function () {//
                            var index = parent.layer.getFrameIndex(window.name);
                            parent.layer.close(index);
                        });
                    }
                }
            });
            return false;//return false 表示不通过页面刷新方式提交表单
        });


        //头像上传
        //头像上传
        layui.upload({
            url: '/prd/upload.do'
            ,method: 'post'
            ,ext:'jpg|png|gif|jpeg'//上传接口的http类型
//            res 接收的是map里面存放的数据,可以通过键获取里面的值
            ,success: function(res){
                layer.msg("上传成功");
                //LAY_demo_upload.src = res.url;
            }
        });










    });
</script>
</body>
</html>
