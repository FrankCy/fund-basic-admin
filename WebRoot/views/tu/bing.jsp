<%@page import="java.util.Map"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="org.jfree.data.general.DefaultPieDataset"%>
<%@ page import="org.jfree.chart.*"%>
<%@ page import="org.jfree.chart.plot.*"%>
<%@ page import="org.jfree.chart.servlet.ServletUtilities"%>
<%@ page import="org.jfree.chart.labels.StandardPieToolTipGenerator"%>
<%@ page import="org.jfree.chart.urls.StandardPieURLGenerator"%>
<%@ page import="org.jfree.chart.entity.StandardEntityCollection"%>
<%@ page import="java.io.*"%>

<HTML> 
<HEAD> 
<META http-equiv=Content-Type content="text/html; charset=GBK"> 
<META NAME="Author" CONTENT="Alpha">
<TITLE>Ա��ѧ����������</TITLE> 
</HEAD> 
<BODY> 
<%
                     Map map=(Map)request.getAttribute("map");
					 int map_xiaoxue=(Integer)map.get("map_xiaoxue");
					 int map_zhongxue=(Integer)map.get("map_zhongxue");
					 int map_gaozhong=(Integer)map.get("map_gaozhong");
                     int map_zhuanke= (Integer)map.get("map_zhuanke");
                     int map_benke= (Integer)map.get("map_benke");
                     int map_shuoshi= (Integer)map.get("map_shuoshi");
                     int map_boshi= (Integer)map.get("map_boshi");
                     int map_boshihou=(Integer)map.get("map_boshihou");
                     
                   DefaultPieDataset data = new DefaultPieDataset(); 
            //���ݳ�ʼ��
           
            data.setValue("Сѧ",map_xiaoxue); 
            data.setValue("��ѧ",map_zhongxue); 
            data.setValue("����",map_gaozhong); 
            data.setValue("ר��",map_zhuanke);
            data.setValue("����",map_benke); 
            data.setValue("˶ʿ",map_shuoshi); 
            data.setValue("��ʿ",map_boshi); 
            data.setValue("��ʿ��",map_boshihou); 
            
            //HttpSession session = request.getSession();

            PiePlot3D plot = new PiePlot3D(data);//����һ��3D��ͼ  
            //plot.setURLGenerator(new StandardPieURLGenerator("DegreedView.jsp"));//�趨ͼƬ���� 
            JFreeChart chart = new JFreeChart("",JFreeChart.DEFAULT_TITLE_FONT, plot, true); 
            chart.setBackgroundPaint(java.awt.Color.white);//��ѡ������ͼƬ����ɫ 
            chart.setTitle("Ա��ѧ����������");//��ѡ������ͼƬ���� 
            plot.setToolTipGenerator(new StandardPieToolTipGenerator()); 
            StandardEntityCollection sec = new StandardEntityCollection(); 
            ChartRenderingInfo info = new ChartRenderingInfo(sec); 
            PrintWriter w = new PrintWriter(out);//���MAP��Ϣ 
            //500��ͼƬ���ȣ�300��ͼƬ�߶�
            //String filename = ServletUtilities.saveChartAsPNG(chart,500,300,info,session); 
            String filename = ServletUtilities.saveChartAsJPEG(chart,500,300,info,session); 
            ChartUtilities.writeImageMap(w,"map0",info,false); 

            String graphURL = request.getContextPath() + "/servlet/DisplayChart?filename=" + filename;
%> 

<P ALIGN="CENTER"> 
<img src="<%= graphURL %>" width=500 height=300 border=0 usemap="#map0"> 
</P> 
</BODY> 
</HTML>