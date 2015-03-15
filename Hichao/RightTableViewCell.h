//
//  RightTableViewCell.h
//  Hichao
//
//  Created by mac on 15/3/15.
//  Copyright (c) 2015年 JK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RightTableViewCell : UITableViewCell





@property(nonatomic ,strong)UIImageView * userImage;

//icon_tuan_tujian_clothes@2x.png
//icon_tuan_remai_clothes@2x.png
@property(nonatomic ,strong)UILabel *userLable;



@property(nonatomic ,strong)UIImageView * markLable;
@property(nonatomic ,strong)UIImageView * markLable2;



//bg_tuangou_zhekou_detail@2x.png
@property(nonatomic ,strong)UIImageView * dateImage;
@property(nonatomic ,strong)UILabel * dateLable;

//楼层
@property(nonatomic ,strong)UILabel * floorLable;


//内容
@property(nonatomic ,strong)UILabel * contentLable;

//回复
@property(nonatomic ,strong)UILabel * replyBut;

//举报
@property(nonatomic ,strong)UILabel * reportLable;






//http://api2.hichao.com/new_forum/thread?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=76C1368B-3957-4F8B-AB72-17981A0654C4&gs=768x1024&gos=8.1&access_token=&thread_id=125476&flag=&state=0

//http://api2.hichao.com/new_forum/thread?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=76C1368B-3957-4F8B-AB72-17981A0654C4&gs=768x1024&gos=8.1&access_token=&thread_id=125478&flag=&state=0

//http://api2.hichao.com/new_forum/thread?gc=AppStore&gf=ipad&gn=mxyc_ipad&gv=5.1&gi=76C1368B-3957-4F8B-AB72-17981A0654C4&gs=768x1024&gos=8.1&access_token=&thread_id=126599&flag=&state=0

@end
