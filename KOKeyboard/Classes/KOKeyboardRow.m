//
//  ExtraKeyboardRow.m
//  KeyboardTest
//
//  Created by Kuba on 28.06.12.
//  Copyright (c) 2012 Adam Horacek, Kuba Brecka
//
//  Website: http://www.becomekodiak.com/
//  github: http://github.com/adamhoracek/KOKeyboard
//	Twitter: http://twitter.com/becomekodiak
//  Mail: adam@becomekodiak.com, kuba@becomekodiak.com
//
//  Permission is hereby granted, free of charge, to any person
//  obtaining a copy of this software and associated documentation
//  files (the "Software"), to deal in the Software without
//  restriction, including without limitation the rights to use,
//  copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following
//  conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
//  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
//  OTHER DEALINGS IN THE SOFTWARE.
//

#import "KOKeyboardRow.h"
#import "KOSwipeButton.h"

#define kDefaultKeys @"TTTTT()\"[]{}'<>\\/$´`~^|€£◉◉◉◉◉-+=%*!?#@&_:;,.1203467589"

@interface KOKeyboardRow ()

@property (nonatomic, retain) UITextView *textView;
@property (nonatomic, assign) CGRect startLocation;


// Add by andy cui

@property (nonatomic, retain) NSMutableArray *swipeButtons;

@end

@implementation KOKeyboardRow

@synthesize textView, startLocation;

@synthesize swipeButtons;

- (void)dealloc{

    
    self.textView = nil;
    self.swipeButtons = nil;
    
}

- (id)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.swipeButtons = [[NSMutableArray alloc] init];
        
    }

    return self;
}

+ (void)applyToTextView:(UITextView *)t
{
    int barHeight = 72;
    int barWidth = 768;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        
        barHeight = 44;
        barWidth = 320;
    
    } else {
        
        
        
    }
    
    KOKeyboardRow *v = [[KOKeyboardRow alloc] initWithFrame:CGRectMake(0, 0, barWidth, barHeight)];
    v.backgroundColor = [UIColor colorWithRed:156/255. green:155/255. blue:166/255. alpha:1.];
    v.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    v.textView = t;
    
    UIView *border1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, barWidth, 1)];
    border1.backgroundColor = [UIColor colorWithRed:51/255. green:51/255. blue:51/255. alpha:1.];
    border1.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [v addSubview:border1];
    
    UIView *border2 = [[UIView alloc] initWithFrame:CGRectMake(0, 1, barWidth, 1)];
    border2.backgroundColor = [UIColor colorWithRed:191/255. green:191/255. blue:191/255. alpha:1.];
    border2.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [v addSubview:border2];
    
    int buttonHeight = 60;
    int leftMargin = 3;
    int topMargin = 1;
    int buttonSpacing = 6;
    int buttonCount = 11;
    
    
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        
        buttonHeight = 40;
        leftMargin = 3;
        topMargin = 1;
        buttonSpacing = 6;
        buttonCount = 11;
        
    } else {
        
        
        
    }
    
    
    int buttonWidth = (barWidth - 2 * leftMargin - (buttonCount - 1) * buttonSpacing) / buttonCount;
    leftMargin = (barWidth - buttonWidth * buttonCount - buttonSpacing * (buttonCount - 1)) / 2;
    
    
    NSString *keys = @"TTTTT()\"[]{}'<>\\/$´`~^|€£◉◉◉◉◉-+=%*!?#@&_:;,.1203467589";
    
    for (int i = 0; i < buttonCount; i++) {
        KOSwipeButton *b = [[KOSwipeButton alloc] initWithFrame:CGRectMake(leftMargin + i * (buttonSpacing + buttonWidth), topMargin + (barHeight - buttonHeight) / 2, buttonWidth, buttonHeight)];
        b.keys = [keys substringWithRange:NSMakeRange(i * 5, 5)];
        b.delegate = v;
        b.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleHeight;
        [v addSubview:b];
    }
    
    t.inputAccessoryView = v;
}

+ (void)applyToTextView:(UITextView *)t withKeys:(NSString *)keys
{
    int barHeight = 72;
    int barWidth = 768;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        
        barHeight = 44;
        barWidth = 320;
        
    } else {
        
        
        
    }
    
    KOKeyboardRow *v = [[KOKeyboardRow alloc] initWithFrame:CGRectMake(0, 0, barWidth, barHeight)];
    v.backgroundColor = [UIColor colorWithRed:156/255. green:155/255. blue:166/255. alpha:1.];
    v.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    v.textView = t;
    
    UIView *border1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, barWidth, 1)];
    border1.backgroundColor = [UIColor colorWithRed:51/255. green:51/255. blue:51/255. alpha:1.];
    border1.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [v addSubview:border1];
    
    UIView *border2 = [[UIView alloc] initWithFrame:CGRectMake(0, 1, barWidth, 1)];
    border2.backgroundColor = [UIColor colorWithRed:191/255. green:191/255. blue:191/255. alpha:1.];
    border2.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [v addSubview:border2];
    
    [v resetWithCustomKeys:keys];
    
    t.inputAccessoryView = v;
}

- (void)resetWithCustomKeys:(NSString *)customKeys{
    
    if (customKeys == nil || [customKeys length] == 0) {
        customKeys = kDefaultKeys;
    }
    
    int barHeight = 72;
    int barWidth = 768;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        
        barHeight = 44;
        barWidth = 320;
        
    } else {
        
        
        
    }
    
    NSString *keys = customKeys;
    
    int buttonHeight = 60;
    int leftMargin = 3;
    int topMargin = 1;
    int buttonSpacing = 6;
    
    int buttonCount = ceilf(keys.length/5.0f);
    
    
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        
        buttonHeight = 40;
        leftMargin = 3;
        topMargin = 1;
        buttonSpacing = 6;
        
        
    } else {
        
        
        
    }
    
    
    int buttonWidth = (barWidth - 2 * leftMargin - (buttonCount - 1) * buttonSpacing) / buttonCount;
    leftMargin = (barWidth - buttonWidth * buttonCount - buttonSpacing * (buttonCount - 1)) / 2;
    
    
    for (UIView *view in self.swipeButtons){
        [view removeFromSuperview];
    }
    
    for (int i = 0; i < buttonCount; i++) {
        KOSwipeButton *b = [[KOSwipeButton alloc] initWithFrame:CGRectMake(leftMargin + i * (buttonSpacing + buttonWidth), topMargin + (barHeight - buttonHeight) / 2, buttonWidth, buttonHeight)];
        b.keys = [keys substringWithRange:NSMakeRange(i * 5, MIN((keys.length -i*5), 5))];
        
        b.delegate = self;
        b.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleHeight;
        [self addSubview:b];
        [self.swipeButtons addObject:b];
    }
    
}

- (void)restoreToDefault{
    
    [self resetWithCustomKeys:kDefaultKeys];
    
}

- (void)insertText:(NSString *)text
{
    
    [[UIDevice currentDevice] playInputClick];
    
    NSRange selectedRange = textView.selectedRange;
    
    BOOL shouldInsert = YES;
    
    if ([textView.delegate respondsToSelector:@selector(textView:shouldChangeTextInRange:replacementText:)]) {
        
        shouldInsert = [textView.delegate textView:textView shouldChangeTextInRange:selectedRange replacementText:text];
        
    }
    
    if (shouldInsert) {
        
        [textView insertText:text];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:UITextViewTextDidChangeNotification object:textView];
        
    }
} 

- (void)trackPointStarted
{
    startLocation = [textView caretRectForPosition:textView.selectedTextRange.start];
}

- (void)trackPointMovedX:(int)xdiff Y:(int)ydiff selecting:(BOOL)selecting
{
    CGRect loc = startLocation;    
    
    loc.origin.y -= textView.contentOffset.y;
    
    UITextPosition *p1 = [textView closestPositionToPoint:loc.origin];
    
    loc.origin.x -= xdiff;
    loc.origin.y -= ydiff;
    
    UITextPosition *p2 = [textView closestPositionToPoint:loc.origin];
    
    if (!selecting) {
        p1 = p2;
    }
    UITextRange *r = [textView textRangeFromPosition:p1 toPosition:p2];
    
    textView.selectedTextRange = r;
}


#pragma mark - UIInputViewAudioFeedback

-(BOOL)enableInputClicksWhenVisible{
    return YES;
}

@end
