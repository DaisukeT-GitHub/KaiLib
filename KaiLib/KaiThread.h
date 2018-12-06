//
//  KaiThread.h
//

#import "KaiLib.h"



/**
 * @brief スレッド制御プロトコル
 *
 * スレッド処理などのメソッドを定義
 *
 */
@protocol KaiThreadProtocol

- (void)runOnThread:(id)object;
- (NSString*)threadName;

@end



/**
 * @brief スレッド制御クラス
 *
 * スレッド起動するクラスのベースクラス
 *
 */
@interface KaiThread : NSObject <KaiThreadProtocol>
{
}

- (void)startThread:(id)object;

@end
