#import <substrate.h>
#import <UIKit/UIKit.h>

@interface CMessageWrap : NSObject
@property(retain, nonatomic) NSString *m_nsContent; 
@property(nonatomic) unsigned long m_uiStatus;
@end


%hook CMessageMgr
- (void)AsyncOnAddMsg:(id)arg1 MsgWrap:(id)arg2{
    
}

- (void)MainThreadNotifyToExt:(id)arg1{
    
}
%end








