/*
* @Author: Larry
* @Date:   2016-12-15 17:20:54
* @Last Modified by:   qinsh
* @Last Modified time: 2016-12-24 21:59:02
* +----------------------------------------------------------------------
* | LarryBlogCMS [ LarryCMS网站内容管理系统 ]
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
         * [参数设置 options]
         */
        LarryTab.prototype.set = function(options){
              var _this = this;
              $.extend(true, _this.config, options);
              return _this;
        };
       
        /**
         * [exists 在layui-tab中检查对应layui-tab-title是否存在，如果存在则返回索引值，不存在返回-1]
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
      
     
			    //iframe 自适应
			    ELEM.contentBox.find('iframe[data-id=' + globalTabIdIndex + ']').each(function() {
			    	$(this).height(ELEM.contentBox.height());
			    });
			    if(_this.config.closed) {
				//监听关闭事件
				    ELEM.titleBox.find('li').children('i.layui-tab-close[data-id=' + globalTabIdIndex + ']').on('click', function() {
				    	element.tabDelete(ELEM.tabFilter, $(this).parent('li').index()).init();
				    });
			    };
			    //切换到当前打开的选项卡
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
