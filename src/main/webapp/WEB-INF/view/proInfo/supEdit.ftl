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

    <input type="hidden" name="id" value="${supplier.id! ''}">

    <div class="layui-form-item">
        <label class="layui-form-label">供应商名称</label>
        <div class="layui-input-block">
            <input type="text" id="supName" value="${supplier.sup_name! ''}" name="supName" required  lay-verify="required" placeholder="请输入昵称" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">注册公司</label>
        <div class="layui-input-block">
            <input type="text" id="url" name="supComp"  value="${supplier.sup_comp! ''}"   placeholder="请输入名字(模糊)" autocomplete="off" class="layui-input">
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">所在地</label>
        <div class="layui-input-block">
            <input type="text" id="url" name="supAddr"  value="${supplier.sup_addr! ''}"   placeholder="请输入名字(模糊)" autocomplete="off" class="layui-input">
        </div>
    </div>



    <div class="layui-form-item">
        <label class="layui-form-label">是否使用</label>
        <div class="layui-input-inline">
            <select id="isUsed" name="isUsed"  >
                <option value="y" >是</option>
                <option value="n">否</option>
            </select>
        </div>
    </div>




    <div class="layui-form-item">
        <label class="layui-form-label">供应商等级</label>
        <div class="layui-input-block">
            <input type="text" id="url" name="supLevel"  value="${supplier.sup_level! ''}"   placeholder="请输入名字(模糊)" autocomplete="off" class="layui-input">
        </div>
    </div>





    <div class="layui-form-item">
        <div class="layui-input-block">
            <button  id="layui-btn"  class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>


</form>
<script type="text/javascript" src="/resources/layui/layui.js"></script>
<script>
    //Demo
    // 待学生自主完成
    layui.use(['form','jquery','layer','laydate','upload'], function(){
        var $ = layui.jquery;
        var form = layui.form();
        var layer = layui.layer;
        var laydate = layui.laydate;

        var is_used="${supplier.is_used}"
        alert(is_used)
        if(is_used == 'y') {
            $("#isUsed").find("option[value = 'y']").attr("selected","selected");
        } else if(is_used == 'n') {
            $("#isUsed").find("option[value = 'n']").attr("selected","selected");
        }



        <#--var is_used="${menus.is_used! ''}"-->

        form.render()

        //监听提交
        form.on('submit(formDemo)', function(params){
            var data = $("form").serializeArray();
            $.ajax({
                type: "POST",
                url: "/sup/updateSup.do",  //后台程序地址
                data: data ,
                //需要post的数据
                success: function(data){           //后台程序返回的标签，比如我喜欢使用1和0 表示成功或者失败
                    if (data.result == 'success'){   //如果成功了, 则关闭当前layer
                        layer.msg('保存成功',{
                            icon: 1,
                            time: 1000 //1秒关闭（如果不配置，默认是3秒）
                        },function(){//
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



    });
</script>