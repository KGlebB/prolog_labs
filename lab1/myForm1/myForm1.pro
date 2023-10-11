% Copyright

implement myForm1
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
    onMouseDown : window::mouseDownListener.
clauses
    onMouseDown(S, Point, _ShiftControlAlt, _Button) :-
        W= S:getVPIWindow(), Point= pnt(X, Y),
        vpi::drawText(W, X, Y, "Нажата клавиш мыши").

% This code is maintained automatically, do not update it manually. 16:00:23-11.10.2023
facts
    ok_ctl : button.
    cancel_ctl : button.
    help_ctl : button.

predicates
    generatedInitialize : ().
clauses
    generatedInitialize():-
        setFont(vpi::fontCreateByName("Tahoma", 8)),
        setText("myForm1"),
        setRect(rct(50,40,290,160)),
        setDecoration(titlebar([closeButton,maximizeButton,minimizeButton])),
        setBorder(sizeBorder()),
        setState([wsf_ClipSiblings,wsf_ClipChildren]),
        menuSet(noMenu),
        addMouseDownListener(onMouseDown),
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
        help_ctl:setAnchors([control::right,control::bottom]).
% end of automatic code
end implement myForm1