//
//  BMHomeItem.h
//  TheOne
//
//  Created by 黄斌民 on 16/7/31.
//  Copyright © 2016年 Bin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BMHomeItem : NSObject

//"hpcontent_id": "1418",
//"hp_title": "VOL.1393",
//"author_id": "-1",
//"hp_img_url": "http://image.wufazhuce.com/FrpyRu13p-M2V1z6Uiq90_hhXep4",
//"hp_img_original_url": "http://image.wufazhuce.com/FrpyRu13p-M2V1z6Uiq90_hhXep4",
//"hp_author": "人来人往&Mr.Z 作品",
//"ipad_url": "http://image.wufazhuce.com/FqwfQTsFLbTJZLSlPGxoP-loQBFM",
//"hp_content": "你，即使是在最虚幻浮华的世界里，你也一定要奋力地在其中扒寻出一些真实的东西来，就像在灾难过境后的废墟上搜索生命迹象那样的，那些深沉的，让你流泪的，疼的，滂沱大雨里依旧听得到的，苦涩的。别人都在做的事，不代表你也非要做。别人追求的虚妄，也不一定就是你的极乐。 by 吕彦妮",
//"hp_makettime": "2016-07-30 21:00:00",
//"last_update_date": "2016-07-22 14:12:06",
//"web_url": "http://m.wufazhuce.com/one/1418",
//"wb_img_url": "",
//"praisenum": 8804,
//"sharenum": 1329,
//"commentnum": 28

@property (copy, nonatomic  ) NSString  *hpcontent_id;
@property (copy, nonatomic  ) NSString  *hp_title;
@property (copy, nonatomic  ) NSString  *author_id;
@property (copy, nonatomic  ) NSString  *hp_img_url;
@property (copy, nonatomic  ) NSString  *hp_img_original_url;
@property (copy, nonatomic  ) NSString  *hp_author;
@property (copy, nonatomic  ) NSString  *ipad_url;
@property (copy, nonatomic  ) NSString  *hp_content;
@property (copy, nonatomic  ) NSString  *hp_makettime;
@property (copy, nonatomic  ) NSString  *last_update_date;
@property (copy, nonatomic  ) NSString  *web_url;
@property (copy, nonatomic  ) NSString  *wb_img_url;
@property (assign, nonatomic) NSInteger praisenum;
@property (assign, nonatomic) NSInteger sharenum;
@property (assign, nonatomic) NSInteger commentnum;

- (NSString *)getDateString;
- (NSAttributedString *)getAttrContent;

@end











