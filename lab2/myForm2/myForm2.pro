% Copyright

implement myForm2
    inherits formWindow
    open core, vpiDomains


clauses
    display(Parent) = Form :-
        Form = new(Parent),
        Form:show().

clauses
    new(Parent):-
        formWindow::new(Parent),
        generatedInitialize().

predicates
    onFactorial_ctrClick : button::clickResponder.
clauses
    onFactorial_ctrClick(_S) = button::defaultAction :-
        fn::calculate(edit_ctl:getText(), O),
        output_ctl:setText(O).

% This code is maintained automatically, do not update it manually. 17:27:11-11.10.2023
facts
    ok_ctl : button.
    cancel_ctl : button.
    help_ctl : button.
    edit_ctl : editControl.
    factorial_ctr : button.
    output_ctl : editControl.

predicates
    generatedInitialize : ().
clauses
    generatedInitialize():-
        setFont(vpi::fontCreateByName("Tahoma", 8)),
        setText("myForm2"),
        setRect(rct(50,40,290,160)),
        setDecoration(titlebar([closeButton,maximizeButton,minimizeButton])),
        setBorder(sizeBorder()),
        setState([wsf_ClipSiblings,wsf_ClipChildren]),
        menuSet(noMenu),
        ok_ctl := button::newOk(This),
        ok_ctl:setText("&OK"),
        ok_ctl:setPosition(48, 98),
        ok_ctl:setSize(56, 16),
        ok_ctl:defaultHeight := false,
        ok_ctl:setAnchors([control::right,control::bottom]),
        cancel_ctl := button::newCancel(This),
        cancel_ctl:setText("Cancel"),
        cancel_ctl:setPosition(112, 98),
        cancel_ctl:setSize(56, 16),
        cancel_ctl:defaultHeight := false,
        cancel_ctl:setAnchors([control::right,control::bottom]),
        help_ctl := button::new(This),
        help_ctl:setText("&Help"),
        help_ctl:setPosition(176, 98),
        help_ctl:setSize(56, 16),
        help_ctl:defaultHeight := false,
        help_ctl:setAnchors([control::right,control::bottom]),
        edit_ctl := editControl::new(This),
        edit_ctl:setText(""),
        edit_ctl:setPosition(124, 12),
        edit_ctl:setWidth(72),
        factorial_ctr := button::new(This),
        factorial_ctr:setText("Факториал"),
        factorial_ctr:setPosition(140, 28),
        factorial_ctr:setWidth(56),
        factorial_ctr:defaultHeight := true,
        factorial_ctr:setClickResponder(onFactorial_ctrClick),
        EnterText_ctl = textControl::new(This),
        EnterText_ctl:setText("Введите число"),
        EnterText_ctl:setPosition(68, 14),
        EnterText_ctl:setSize(52, 10),
        StaticText_ctl = textControl::new(This),
        StaticText_ctl:setText("Значение факториала"),
        StaticText_ctl:setPosition(40, 66),
        StaticText_ctl:setSize(80, 10),
        output_ctl := editControl::new(This),
        output_ctl:setText(""),
        output_ctl:setPosition(124, 64),
        output_ctl:setWidth(72),
        output_ctl:setEnabled(false).
% end of automatic code
end implement myForm2