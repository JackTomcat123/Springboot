/*
* @Author: Larry
* @Date:   2016-12-15 17:20:54
* @Last Modified by:   qinsh
* @Last Modified time: 2016-12-24 21:59:02
* +----------------------------------------------------------------------
* | LarryBlogCMS [ LarryCMS��վ���ݹ���ϵͳ ]
* | Copyright (c) 2016-2017 http://www.larrycms.com All rights reserved.
* | Licensed ( http://www.larrycms.com/licenses/ )
* | Author: qinshouwei <313492783@qq.com>
* +----------------------------------------------------------------------
*/
layui.define(['element'], function(exports){
   var  element = layui.element(),
        $ = layui.jquery,
		layer = parent.layer === undefined ? layui.layer : parent.layer,
		module_name = 'navtab',
		globalTabIdIndex = 0,
		LarryTab = function(){
              this.config ={
              	  elem: undefined,
				  closed: true 
              };
		};
        var ELEM = {};
        /**
         * [�������� options]
         */
        LarryTab.prototype.set = function(options){
              var _this = this;
              $.extend(true, _this.config, options);
              return _this;
        };
       
        /**
         * [exists ��layui-tab�м���Ӧlayui-tab-title�Ƿ���ڣ���������򷵻�����ֵ�������ڷ���-1]
         * @param  {[type]} title [description]
         * @return {[type]}       [description]
         */
        LarryTab.prototype.exists = function(title){
            var _this = ELEM.titleBox === undefined ? this.init() : this,
			    tabIndex = -1;
			ELEM.titleBox.find('li').each(function(i, e) {
			    var $em = $(this).children('em');
			    if($em.text() === title) {
				      tabIndex = i;
			    };
		    });
		    return tabIndex;
        };
      
     
			    //iframe ����Ӧ
			    ELEM.contentBox.find('iframe[data-id=' + globalTabIdIndex + ']').each(function() {
			    	$(this).height(ELEM.contentBox.height());
			    });
			    if(_this.config.closed) {
				//�����ر��¼�
				    ELEM.titleBox.find('li').children('i.layui-tab-close[data-id=' + globalTabIdIndex + ']').on('click', function() {
				    	element.tabDelete(ELEM.tabFilter, $(this).parent('li').index()).init();
				    });
			    };
			    //�л�����ǰ�򿪵�ѡ�
			    element.tabChange(ELEM.tabFilter, ELEM.titleBox.find('li').length - 1);
		    }else {
			    element.tabChange(ELEM.tabFilter, tabIndex);
		    }
        };
    var navtab = new LarryTab();
    exports(module_name, function(options) {
		return navtab.set(options);
	});
		
});
