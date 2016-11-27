#import <substrate.h>
#import <UIKit/UIKit.h>

@interface CMessageWrap : NSObject
@property(retain, nonatomic) NSString *m_nsContent; 
@property(nonatomic) unsigned long m_uiStatus;
@end

@interface BaseMsgContentLogicController : NSObject
- (void)SendTextMessage:(id)arg1;
@end

%hook BaseMsgContentLogicController

- (void)OnAddMsg:(id)arg1 MsgWrap:(CMessageWrap *)arg2{
    %orig;
    NSLog(@"yujianbo:%lu",[arg2 m_uiStatus]);
    if([arg2 m_uiStatus]==4){
        NSString *msg = [arg2 m_nsContent];
        NSString *sendMsg = [NSString stringWithFormat:@"auto reply to: %@",msg];
        [self SendTextMessage:sendMsg];
    }
}
    
%end








