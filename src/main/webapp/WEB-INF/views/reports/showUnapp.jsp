<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="constants.ForwardConst" %>
<%@ page import="constants.AttributeConst" %>

<c:set var="actRep" value="${ForwardConst.ACT_REP.getValue()}" />
<c:set var="commIdx" value="${ForwardConst.CMD_INDEX.getValue()}" />
<c:set var="commEdt" value="${ForwardConst.CMD_EDIT.getValue()}" />
<c:set var="commApp" value="${ForwardConst.CMD_APPROVE.getValue()}"/>
<c:set var="commUpdAF" value="${ForwardConst.CMD_UPDATE_APP_FLAG.getValue()}"/>

<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">

        <h2>未承認日報 詳細ページ</h2>

        <table>
            <tbody>
                <tr>
                    <th>氏名</th>
                    <td><c:out value="${report.employee.name}" /></td>
                </tr>
                <tr>
                    <th>日付</th>
                    <fmt:parseDate value="${report.reportDate}" pattern="yyyy-MM-dd" var="reportDay" type="date" />
                    <td><fmt:formatDate value='${reportDay}' pattern='yyyy-MM-dd' /></td>
                </tr>
                <tr>
                    <th>内容</th>
                    <td><pre><c:out value="${report.content}" /></pre></td>
                </tr>
                <tr>
                    <th>登録日時</th>
                    <fmt:parseDate value="${report.createdAt}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="createDay" type="date" />
                    <td><fmt:formatDate value="${createDay}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                </tr>
                <tr>
                    <th>更新日時</th>
                    <fmt:parseDate value="${report.updatedAt}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="updateDay" type="date" />
                    <td><fmt:formatDate value="${updateDay}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                </tr>
            </tbody>
        </table>

        <br/>
        <form method="POST" action="<c:url value='?action=${actRep}&command=${commUpdAF}' />">
        <label for="${AttributeConst.REP_COMMENT.getValue()}">コメント</label><br/>
        <textarea name="${AttributeConst.REP_COMMENT.getValue()}" id="${AttributeConst.REP_COMMENT.getValue()}" rows="10" cols="50">${report.comment}</textarea>
        <br/><br/>

        <label for="${AttributeConst.REP_APPROVAL_FLAG.getValue()}">承認状況</label><br/>
        <select name="${AttributeConst.REP_APPROVAL_FLAG.getValue()}" id="${AttributeConst.REP_APPROVAL_FLAG.getValue()}">
            <option value="${AttributeConst.UNAPPROVED.getIntegerValue()}" <c:if test="${report.approvalFlag==AttributeConst.UNAPPROVED.getIntegerValue()}">selected</c:if>>未承認</option>
            <option value="${AttributeConst.APPROVED.getIntegerValue()}">承認済み</option>
            <option value="${AttributeConst.REMAND.getIntegerValue()}">差し戻し</option>
        </select>

        <br/><br/>
        <input type="hidden" name="${AttributeConst.REP_ID.getValue()}" value="${report.id}" />
        <input type="hidden" name="${AttributeConst.TOKEN.getValue()}" value="${_token}" />

        <button type="submit">送信</button>

        </form>
        <p>
            <a href="<c:url value='?action=${actRep}&command=${commApp}' />">未承認一覧に戻る</a>
        </p>
    </c:param>
</c:import>