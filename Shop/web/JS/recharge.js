/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function checkRechargeCardExistance()
{
    console.log("here");
    if ($("#cardNumber2").val() != "")
    {
        $.get("CheckCardNumberExistanceServlet?cardNumber=" + $("#cardNumber2").val(), rechargeCardCallBack);
    }
}
function rechargeCardCallBack(response, status, xhr)
{
    if (status == "success")
    {
        console.log("here");
        if (response == "Valid Card Number")
        {
            $("#rechargeButton2").attr ("disabled",false);
        } else
        {
            $("#rechargeButton2").attr ("disabled",true);
        }
    }
}
