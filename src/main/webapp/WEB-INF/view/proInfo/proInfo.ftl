<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="Generator" content="EditPlus®">
    <meta name="Author" content="">
    <meta name="Keywords" content="">
    <meta name="Description" content="">
    <title>商品信息修改</title>
    <link rel="stylesheet" href="/resources/layui/css/layui.css">
</head>

<body>
<fieldset class="layui-elem-field" style="height: 20%" >
    <legend>商品信息修改</legend>
    <div class="layui-field-box" >
        <form class="layui-form" id="pageSubmit">
            <div class="layui-form-item">
                <label class="layui-form-label">商品编号</label>
                <div class="layui-input-inline">
                    <input type="text" id="prdNo" name="prdNo"  value="${result.prdNo!''}" placeholder="请输入" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">商品名称</label>
                <div class="layui-input-inline">
                    <input type="text" id="prdName" name="prdName"  value="${result.prdName!''}" placeholder="请输入" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">参加活动</label>
                <div class="layui-input-inline">
                    <select id="isSales" name="isSales"   >
                        <option  value="" >请选择</option>
                        <option value="y" >参加</option>
                        <option value="n">不参加</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">商品简码</label>
                <div class="layui-input-inline">
                    <input type="text" id="prdCode" name="prdCode"  value="${result.prdCode!''}" placeholder="请输入" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">退换货</label>
                <div class="layui-input-inline">
                    <select id="isReturn" name="isReturn" >
                        <option value="" >请选择</option>
                        <option value="y" >支持</option>
                        <option value="n">不支持</option>
                    </select>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">商品类别</label>
                <div class="layui-input-inline">
                    <select id="prdType" name="prdType" >
                        <option value="" >请选择</option>
                    <#list proType as item>
                        <option value="${item.tp_cd}">${item.tp_name}</option>
                    </#list>
                    </select>
                </div>

            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">售卖方式</label>
                <div class="layui-input-inline">
                    <select id="saleCode" name="saleCode" >
                        <option value="" >请选择</option>
                        <option value="100" >热线</option>
                        <option value="200">网站</option>
                        <option value="300">手机app</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">是否使用</label>
                <div class="layui-input-inline">
                    <select id="isUsed" name="isUsed"  >
                        <option value="" >请选择</option>
                        <option value="y" >是</option>
                        <option value="n">否</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">供应商</label>
                <div class="layui-input-inline">
                    <select id="supId" name="supId" >
                        <option value="" >请选择</option>
                    <#list supplier as item>
                        <option value="${item.id}">${item.sup_name}</option>
                    </#list>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">捆绑销售</label>
                <div class="layui-input-inline">
                    <select id="isGifts" name="isGifts" >
                        <option value="" >请选择</option>
                        <option value="y" >捆绑</option>
                        <option value="n">不绑</option>
                    </select>
                </div>

            </div>
                <div class="layui-input-inline">
                    <button class="layui-btn" lay-submit lay-filter="userInfoForm">立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            <input value="${result.id! '' }" name="id" type="hidden" >
        </form>
    </div>
</fieldset>

<script type="text/javascript" src="/resources/layui/layui.js"></script>
<script type="text/javascript">
    //Demo
    // 待学生自主完成

    layui.use(['form','jquery','layer','laydate','upload'], function(){

        var $ = layui.jquery;
        var form = layui.form();
        var layer = layui.layer;

        //监听提交
        form.on('submit(userInfoForm)', function(params){


            //表单数据
            /* var username = $("#username").val();
             var password = $("#password").val();
             var gender = $("input[name='gender']:checked").val();
             var organization = $("#organization").val();*/

            //等同于上面注释掉的部分
            var data = $("form").serializeArray();


            // 封装之后的格式
            //var data = {"username":username,"password":password}

            $.ajax({
                type: "POST",
                url: "/prd/updateProInfo.do",  //后台程序地址
                data: data ,
                //需要post的数据
                success: function(data){           //后台程序返回的标签，比如我喜欢使用1和0 表示成功或者失败
                    if (data.result == 'success'){   //如果成功了, 则关闭当前layer
                        layer.msg('保存成功',{
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
                    }else if(data.result == 'failure'){
                        layer.msg('保存失败')
                    }
                }
            });
            return false;//return false 表示不通过页面刷新方式提交表单
        });

        var isSales2="${result.isSales!''}";
        var ss1 = "#isSales option[value='"+isSales2+"']";
        $(ss1).attr('selected','selected');

        var isReturn2="${result.isReturn!''}";
        var ss2 = "#isReturn option[value='"+isReturn2+"']";
        $(ss2).attr('selected','selected');

        var prdType2="${result.prdType!''}";
        var ss3 = "#prdType option[value='"+prdType2+"']";
        $(ss3).attr('selected','selected');

        var saleCode2="${result.saleCode!''}";
        var ss4 = "#saleCode option[value='"+saleCode2+"']";
        $(ss4).attr('selected','selected');

        var isUsed2="${result.isUsed!''}";
        var ss5 = "#isUsed option[value='"+isUsed2+"']";
        $(ss5).attr('selected','selected');

        var supId2="${result.supId!''}";
        var ss6 = "#supId option[value='"+supId2+"']";
        $(ss6).attr('selected','selected');

        var isGifts2="${result.isGifts!''}";
        var ss7 = "#isGifts option[value='"+isGifts2+"']";
        $(ss7).attr('selected','selected');
        form.render();


    });
</script>
</body>
</html>