#import <substrate.h>
#import <UIKit/UIKit.h>

@interface CMessageWrap : NSObject
@property(retain, nonatomic) NSString *m_nsContent; 
@property(nonatomic) unsigned long m_uiStatus;
@end

@interface MMUIHookView : NSObject
- (id)subviews;
@end

@interface TextMessageNodeView : NSObject
@end

@interface  MMInputToolView : NSObject
- (void)TextViewDidEnter:(id)arg1;
@end

@interface MMMultiSelectToolView : NSObject
@end

@interface BaseMsgContentViewController : NSObject
@property(retain, nonatomic) MMInputToolView *toolView; 
@end

//%hook TextMessageNodeView
//
//- (id)initWithMessageWrap:(CMessageWrap *)arg1 Contact:(id)arg2 ChatContact:(id)arg3{
//    id result = %orig;
//    
//    NSString *msg = [arg1 m_nsContent];
//    NSLog(@"wechatauto: %@",[arg1 m_nsContent]);
//    NSLog(@"wechatauto: self %@",[self class]);
//    NSLog(@"wechatauto: self super %@",[[self performSelector:@selector(superview)] class]);
////    MMUIHookView *mainUI = [[[[ [self superview ]superview] superview] superview ]superview ];
//    MMUIHookView *mainUI = nil;
//    NSLog(@"wechatauto: mainUI %@",[mainUI class]);
//    NSArray *subArray = [mainUI subviews];
//    NSLog(@"wechatauto: %lu",(unsigned long)[subArray count]);
//    for(UIView *sub in subArray){
//        NSLog(@"wechatauto: %@",[sub class]);
//        if( [sub isKindOfClass:NSClassFromString(@"MMInputToolView")] ){
//            NSLog(@"wechatauto: get in");
//            if([msg isEqualToString:@"password"]){
//                [sub performSelector:@selector(TextViewDidEnter:) withObject:@"auto reply"];
//            }
//
//        }
//    }
//    
//    return result;
//}
//
//
//%end

%hook BaseMsgContentViewController

- (void)addMessageNode:(CMessageWrap *)arg1 layout:(BOOL)arg2 addMoreMsg:(BOOL)arg3{
    %orig;
    NSString *msg = [arg1 m_nsContent];
    
    if([arg1 m_uiStatus]==4){
//        [[self toolView] performSelector:@selector(TextViewDidEnter) withObject:@"this is auto reply"];
        NSString * sendMsg = [NSString stringWithFormat:@"aotu reply to :%@",msg];
        [[self toolView] TextViewDidEnter:sendMsg];
    }
    
}



%end








