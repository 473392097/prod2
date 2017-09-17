<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="Generator" content="EditPlus®">
    <meta name="Author" content="">
    <meta name="Keywords" content="">
    <meta name="Description" content="">
    <title>商品查询</title>
    <link rel="stylesheet" href="/resources/layui/css/layui.css">
</head>

<body>
<fieldset class="layui-elem-field" style="height: 20%" >
    <legend>商品查询</legend>
    <div class="layui-field-box" >
        <form class="layui-form" id="pageSubmit">
            <div class="layui-form-item">

                <label class="layui-form-label">商品编号</label>
                <div class="layui-input-inline">
                    <input type="text" id="prdNo" name="prdNo"  value="" placeholder="请输入" autocomplete="off" class="layui-input">
                </div>

                <label class="layui-form-label">商品名称</label>
                <div class="layui-input-inline">
                    <input type="text" id="prdName" name="prdName"  value="" placeholder="请输入" autocomplete="off" class="layui-input">
                </div>


                <label class="layui-form-label">参加活动</label>
                <div class="layui-input-inline">
                    <select id="isSales" name="isSales"  >
                        <option  value="" >请选择</option>
                        <option value="0" >一级</option>
                        <option value="1">二级</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">商品简码</label>
                <div class="layui-input-inline">
                    <input type="text" id="prdCode" name="prdCode"  value="" placeholder="请输入" autocomplete="off" class="layui-input">
                </div>


                <label class="layui-form-label">退换货</label>
                <div class="layui-input-inline">
                    <select id="isReturn" name="isReturn" >
                        <option value="" >请选择</option>
                        <option value="0" >一级</option>
                        <option value="1">二级</option>
                    </select>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">商品类别</label>
                <div class="layui-input-inline">
                    <select id="prdType" name="prdType">
                        <option value="" >请选择</option>

                    </select>
                </div>


                <label class="layui-form-label">上架时间</label>
                <div class="layui-input-inline">
                    <input id="instDate1" name="instDate1" value="" class="layui-input-inline" placeholder="开始日" onclick="layui.laydate({elem: this})">
                    <input id="instDate1" name="instDate2" value="" class="layui-input-inline" placeholder="截止日" onclick="layui.laydate({elem: this})">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">售卖方式</label>
                <div class="layui-input-inline">
                    <select id="saleCode" name="saleCode" >
                        <option value="" >请选择</option>
                        <option value="0" >一级</option>
                        <option value="1">二级</option>
                    </select>
                </div>

                <label class="layui-form-label">是否使用</label>
                <div class="layui-input-inline">
                    <select id="isUsed" name="isUsed"  >
                        <option value="" >请选择</option>
                        <option value="0" >一级</option>
                        <option value="1">二级</option>
                    </select>
                </div>


                <label class="layui-form-label">供应商</label>
                <div class="layui-input-inline">
                    <select id="supId" name="supId" >
                        <option value="" >请选择</option>

                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">捆绑销售</label>
                <div class="layui-input-inline">
                    <select id="isGifts" name="isGifts" >
                        <option value="" >请选择</option>
                        <option value="0" >一级</option>
                        <option value="1">二级</option>
                    </select>
                </div>

                    <label class="layui-form-label">销售方式</label>
                    <div class="layui-input-inline">
                        <select id="saleCode" name="saleCode" >
                            <option value="" >请选择</option>
                            <option value="0" >一级</option>
                            <option value="1">二级</option>
                        </select>
                    </div>

                <div class="layui-input-inline">
                    <button class="layui-btn" lay-submit lay-filter="registerForm">立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
            <input type="hidden" id="currentPage" name="currentPage" >
        </form>
    </div>
</fieldset>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>商品列表</legend>
</fieldset>
<div class="layui-form">
<table class="layui-table">
<colgroup>
<col width="100">
<col width="100">
<col width="100">
<col width="100">
<col width="100">
<col width="100">
<col width="100">
<col width="100">
<col width="100">
<col width="60">
<col width="60">
<col width="200">
<col width="400">
</colgroup>
<thead>
<tr>
<th>商品编号</th>
<th>商品名称</th>
<th>商品简码</th>
<th>商品类别</th>
<th>供应商</th>
<th>供应商公司</th>
<th>上架时间</th>
<th>参与活动</th>
<th>售卖方式</th>
<th>是否为赠品</th>
<th>支持退换货</th>
<th>是否使用</th>
<th>操作</th>
</tr>
</thead>
<tbody>
<#list list as item>
<tr>
<td>${item.prdNo}</td>
<td>${item.prdName}</td>
<td>${item.prdCode}</td>
<td>${item.prdType}</td>
<td>${item.supName}</td>
<td>${item.supComp}</td>
<td>${item.shDate}</td>
<td>
    <#if item.isSales==0>一级菜单
    <#else>二级菜单
    </#if>
${item.isSales}
</td>
    <td>${item.saleCode}</td>
    <td>${item.isGifts}</td>
    <td>${item.isReturn}</td>
    <td>${item.isUsed}</td>
<td>
<#if item.p_id==0>一级菜单
<#else>二级菜单
</#if>
</td>
<td>${item.name}</td>
<td>${item.url}</td>
<td>
<#if item.is_used=='y'>是
<#else>否
</#if>

</td>

<td><input id="send" hidden="hidden" value="${item.prdNo}">
<a class="userInfo" href="javascript:;">修改</a><a class="userInfo" href="javascript:;">添加明细</a></td>
</tr>
</#list>
</tbody>
</table>
</div>
<script type="text/javascript" src="/resources/layui/layui.js"></script>
<script type="text/javascript">

layui.define([ 'element', 'form', 'layer', 'laypage'], function(exports) {



        })
        </script>
</body>
</html>