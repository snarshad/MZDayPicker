//
//  NSDate+MZExtensions.h
//
//  Created by Arshad Tayyeb on 3/7/12.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extensions)
- (NSDate *)mz_floor; // returns midnight (beginning) of date
- (NSDate *)mz_ceil; //returns 23:59:59 of date
@end



