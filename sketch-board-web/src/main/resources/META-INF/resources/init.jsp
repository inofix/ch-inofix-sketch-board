<%--
    init.jsp
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://liferay.com/tld/security" prefix="liferay-security" %>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>

<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>
<%@ taglib uri="http://liferay.com/tld/portlet" prefix="liferay-portlet" %>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme" %>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>

<%@ page import="ch.inofix.sketchboard.configuration.SketchBoardConfiguration" %>
<%@ page import="ch.inofix.sketchboard.model.SketchBoard" %>
<%@ page import="ch.inofix.sketchboard.service.SketchBoardServiceUtil" %>
<%@ page import="ch.inofix.sketchboard.service.SketchBoardService" %>

<%@ page import="com.liferay.portal.kernel.dao.search.SearchEntry" %>
<%@ page import="com.liferay.portal.kernel.dao.search.ResultRow" %>

<%@ page import="com.liferay.portal.kernel.language.LanguageUtil" %>

<%@ page import="com.liferay.portal.kernel.model.PersistedModel" %>

<%@ page import="com.liferay.portal.kernel.portlet.PortalPreferences" %>
<%@ page import="com.liferay.portal.kernel.portlet.PortletPreferencesFactoryUtil" %>

<%@ page import="com.liferay.portal.kernel.util.GetterUtil" %>
<%@ page import="com.liferay.portal.kernel.util.HtmlUtil" %>
<%@ page import="com.liferay.portal.kernel.util.ParamUtil" %>
<%@ page import="com.liferay.portal.kernel.util.StringPool" %>

<%@page import="com.liferay.portal.kernel.util.Validator"%>

<%@ page import="javax.portlet.PortletPreferences" %>
<%@page import="javax.portlet.PortletURL"%>

<%@ page import="java.util.List" %>

<liferay-theme:defineObjects />

<portlet:defineObjects />

<%
    PortalPreferences portalPreferences = PortletPreferencesFactoryUtil
                                    .getPortalPreferences(request);

    long sketchBoardId = GetterUtil.getLong(portletPreferences
                            .getValue("sketchBoardId", "0"));

    SketchBoardConfiguration sketchBoardConfiguration =
            (SketchBoardConfiguration) request.getAttribute(
                SketchBoardConfiguration.class.getName());

    if (Validator.isNotNull(sketchBoardConfiguration)) {
        sketchBoardId = GetterUtil.getLong(portletPreferences.getValue(
                "sketchBoardId", String.valueOf(sketchBoardConfiguration
                                                .sketchBoardId())));
    }
%>

