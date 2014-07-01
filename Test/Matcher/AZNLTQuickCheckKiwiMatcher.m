//
// Created by azu on 2013/06/23.
// License MIT
//


#import "NLTQuickCheck/NLTQTestable.h"
#import "AZNLTQuickCheckKiwiMatcher.h"


@interface AZNLTQuickCheckKiwiMatcher ()
@property BOOL expectedValue;
@end

@implementation AZNLTQuickCheckKiwiMatcher {

}

#pragma mark - Getting Matcher Strings

+ (NSArray *)matcherStrings {
    return @[@"beSuccess", @"beFailure"];
}

#pragma mark - Matching

- (BOOL)evaluate {
    if (![self.subject isKindOfClass:[NLTQTestable class]]) {
        [NSException raise:@"KWMatcherException" format:@"subject does not NLTQTestable"];
    }
    if (![self.subject respondsToSelector:@selector(success)]) {
        [NSException raise:@"KWMatcherException" format:@"subject does not respond to -success"];
    }

    return [self.subject success] == self.expectedValue;
}

#pragma mark - Getting Failure Messages

- (NSString *)failureMessageForShould {
    return [(NLTQTestable *)self.subject prettyReport];
}

- (NSString *)description {
    if (self.expectedValue) {
        return @"be success";
    }
    return @"be failure";
}

- (void)beSuccess {
    self.expectedValue = YES;
}

- (void)beFailure {
    self.expectedValue = NO;
}


@end