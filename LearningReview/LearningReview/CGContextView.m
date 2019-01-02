//
//  CGContextView.m
//  LearningReview
//
//  Created by 万浩 on 2018/11/28.
//  Copyright © 2018 haohao. All rights reserved.
//

#import "CGContextView.h"
#import <QuartzCore/QuartzCore.h>


@implementation CGContextView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //写文字
    CGContextSetRGBFillColor(context, 1.0, 0, 0, 1.0);
    UIFont *font = [UIFont systemFontOfSize:15.0f];
    [@"画圆" drawInRect:CGRectMake(10, 20, 80, 20) withAttributes:@{NSFontAttributeName:font, NSForegroundColorAttributeName:[UIColor redColor]}];
    
    CGContextSetRGBStrokeColor(context,1,1,1,1.0);//画笔线的颜色
    CGContextSetLineWidth(context, 1.0);
    // x,y为圆点坐标，radius半径，startAngle为开始的弧度，endAngle为 结束的弧度，clockwise 0为顺时针，1为逆时针。
    CGContextAddArc(context, 100, 20, 15, 0, 2 * M_PI, 0);
    CGContextDrawPath(context, kCGPathStroke);
    
    CGContextAddArc(context, 100 + 30 + 20, 20, 15, 0, 2 * M_PI, 0);
    CGContextDrawPath(context, kCGPathFill);
    
    CGContextAddArc(context, 100 + 30 + 20 + 30 + 20, 20, 15, 0, 2 * M_PI, 0);
    CGContextSetFillColorWithColor(context, [UIColor yellowColor].CGColor);
    CGContextSetLineWidth(context, 2.0);
    CGContextDrawPath(context, kCGPathFillStroke); //绘制路径加填充

    
    
    [@"画线及孤线：" drawInRect:CGRectMake(10, 80, 100, 20) withAttributes:@{NSFontAttributeName:font, NSForegroundColorAttributeName:[UIColor redColor]}];
    CGPoint apoints[3];
    apoints[0] = CGPointMake(100, 80);//坐标
    apoints[1] = CGPointMake(130, 80);//坐标2
    apoints[2] = CGPointMake(150, 80);//坐标2

    CGContextAddLines(context, apoints, 3);
    CGContextDrawPath(context, kCGPathStroke);
    
    [@"画矩形：" drawInRect:CGRectMake(10, 120, 80, 20) withAttributes:@{NSFontAttributeName:font, NSForegroundColorAttributeName:[UIColor redColor]}];
    
    CGContextStrokeRect(context, CGRectMake(130 + 10, 120, 30, 30));
    CGContextDrawPath(context, kCGPathFill);
    
    CGContextSetFillColorWithColor(context, [UIColor blueColor].CGColor);//填充颜色
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);//线框颜色
    CGContextSetLineWidth(context, 2.0f);
    CGContextAddRect(context,CGRectMake(140 + 30 + 20, 120, 30, 30));//画方框
    CGContextDrawPath(context, kCGPathFillStroke);//绘画路径
    
    CAGradientLayer *gradient1 = [CAGradientLayer layer];
    gradient1.frame = CGRectMake(240, 120, 30, 30);
    gradient1.colors = [NSArray arrayWithObjects:(id)[UIColor whiteColor].CGColor,
                        (id)[UIColor grayColor].CGColor,
                        (id)[UIColor blackColor].CGColor,
                        (id)[UIColor yellowColor].CGColor,
                        (id)[UIColor blueColor].CGColor,
                        (id)[UIColor redColor].CGColor,
                        (id)[UIColor greenColor].CGColor,
                        (id)[UIColor orangeColor].CGColor,
                        (id)[UIColor brownColor].CGColor,nil];
    [self.layer insertSublayer:gradient1 atIndex:0];
    
    
    [@"画扇形和椭圆：" drawInRect:CGRectMake(10, 160, 110, 20) withAttributes:@{NSFontAttributeName:font, NSForegroundColorAttributeName:[UIColor redColor]}];
    
    //椭圆
    CGContextAddEllipseInRect(context, CGRectMake(160, 180, 20, 8));
    CGContextDrawPath(context, kCGPathFillStroke);
    
    CGContextAddArc(context, 110, 180, 30, 0, M_PI, 0);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);
    
    
    [@"画三角形：" drawInRect:CGRectMake(10, 220, 80, 20) withAttributes:@{NSFontAttributeName:font, NSForegroundColorAttributeName:[UIColor redColor]}];
    CGPoint sPoints[3];
    sPoints[0] =CGPointMake(100, 220);//坐标1
    sPoints[1] =CGPointMake(130, 220);//坐标2
    sPoints[2] =CGPointMake(130, 240);//坐标3
    CGContextAddLines(context, sPoints, 3);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);
    
    [@"画圆角矩形：" drawInRect:CGRectMake(10, 260, 100, 20) withAttributes:@{NSFontAttributeName:font, NSForegroundColorAttributeName:[UIColor redColor]}];
    
    float fw = 150;
    float fh = 280;
    CGContextMoveToPoint(context, fw, fh - 20);//开始坐标
    CGContextAddArcToPoint(context, fw, fh, fw-20, fh, 10);  // 右下角角度
    CGContextAddArcToPoint(context, 120, fh, 120, fh-20, 10); // 左下角角度
    CGContextAddArcToPoint(context, 120, 250, fw-20, 250, 10); // 左上角
    CGContextAddArcToPoint(context, fw, 250, fw, fh-20, 10); // 右上角
    
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathStroke);
    
    [@"画贝塞尔曲线：" drawInRect:CGRectMake(10, 300, 100, 20) withAttributes:@{NSFontAttributeName:font, NSForegroundColorAttributeName:[UIColor redColor]}];
    //二次曲线
    CGContextMoveToPoint(context, 120, 300);
    CGContextAddQuadCurveToPoint(context, 190, 310, 120, 390);//控制点和控制点终点
    CGContextStrokePath(context);
    //三次曲线
    CGContextMoveToPoint(context, 200, 300);
    CGContextAddCurveToPoint(context, 250, 280, 250, 400, 280, 300);//控制点和控制点终点
    CGContextStrokePath(context);
    
    [@"图片：" drawInRect:CGRectMake(10, 340, 80, 20) withAttributes:@{NSFontAttributeName:font, NSForegroundColorAttributeName:[UIColor redColor]}];
    UIImage *image = [UIImage imageNamed:@"text.png"];
    
    [image drawInRect:CGRectMake(60, 340, 20, 20)];
    
    CGContextDrawImage(context, CGRectMake(100, 340, 20, 20), image.CGImage);
}

@end
