function varargout = RobotGUI(varargin)
% ROBOTGUI MATLAB code for RobotGUI.fig
%      ROBOTGUI, by itself, creates a new ROBOTGUI or raises the existing
%      singleton*.
%
%      H = ROBOTGUI returns the handle to a new ROBOTGUI or the handle to
%      the existing singleton*.
%
%      ROBOTGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ROBOTGUI.M with the given input arguments.
%
%      ROBOTGUI('Property','Value',...) creates a new ROBOTGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before RobotGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to RobotGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help RobotGUI

% Last Modified by GUIDE v2.5 09-Oct-2013 15:34:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @RobotGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @RobotGUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% --- Executes just before RobotGUI is made visible.
function RobotGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to RobotGUI (see VARARGIN)

% Choose default command line output for RobotGUI
handles.output = hObject;
handles.thetas = zeros(1,6);
[endEffPos, XYZ, R] = FK(handles.thetas);
drawRobot(XYZ,R, handles.axes1);
guidata(hObject, handles);

% UIWAIT makes RobotGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = RobotGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
% --- Executes on slider movement.
function angle1_Callback(hObject, eventdata, handles)
% hObject    handle to angle1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.thetas(1) = get(hObject,'Value');
[endEffPos, XYZ, R] = FK(handles.thetas);
drawRobot(XYZ,R, handles.axes1);
IK_solution = IK(endEffPos, R(:,:,7));
[~, XYZ2, R2] = FK(IK_solution(1:6,handles.IK_select));
drawRobot(XYZ2,R2, handles.axes2);
upDateTables(handles, IK_solution, handles.thetas, endEffPos, XYZ(6,:), R(:,:,7));
guidata(hObject, handles);
% --- Executes during object creation, after setting all properties.
function angle1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to angle1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
% --- Executes on slider movement.
function angle2_Callback(hObject, eventdata, handles)
% hObject    handle to angle2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.thetas(2) = get(hObject,'Value');
[endEffPos, XYZ, R] = FK(handles.thetas);
drawRobot(XYZ,R, handles.axes1);
IK_solution = IK(endEffPos, R(:,:,7));
[~, XYZ2, R2] = FK(IK_solution(1:6,handles.IK_select));
drawRobot(XYZ2,R2, handles.axes2);
upDateTables(handles, IK_solution, handles.thetas, endEffPos, XYZ(6,:), R(:,:,7));
guidata(hObject, handles);
% --- Executes during object creation, after setting all properties.
function angle2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to angle2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
% --- Executes on slider movement.
function angle3_Callback(hObject, eventdata, handles)
% hObject    handle to angle3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.thetas(3) = get(hObject,'Value');
[endEffPos, XYZ, R] = FK(handles.thetas);
drawRobot(XYZ,R, handles.axes1);
IK_solution = IK(endEffPos, R(:,:,7));
[~, XYZ2, R2] = FK(IK_solution(1:6,handles.IK_select));
drawRobot(XYZ2,R2, handles.axes2);
upDateTables(handles, IK_solution, handles.thetas, endEffPos, XYZ(6,:), R(:,:,7));
guidata(hObject, handles);
% --- Executes during object creation, after setting all properties.
function angle3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to angle3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
% --- Executes on slider movement.
function angle4_Callback(hObject, eventdata, handles)
% hObject    handle to angle4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

handles.thetas(4) = get(hObject,'Value');
[endEffPos, XYZ, R] = FK(handles.thetas);
drawRobot(XYZ,R, handles.axes1);
IK_solution = IK(endEffPos, R(:,:,7));
[~, XYZ2, R2] = FK(IK_solution(1:6,handles.IK_select));
drawRobot(XYZ2,R2, handles.axes2);
upDateTables(handles, IK_solution, handles.thetas, endEffPos, XYZ(6,:), R(:,:,7));
guidata(hObject, handles);
% --- Executes during object creation, after setting all properties.
function angle4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to angle4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
% --- Executes on slider movement.
function angle5_Callback(hObject, eventdata, handles)
% hObject    handle to angle5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

handles.thetas(5) = get(hObject,'Value');
[endEffPos, XYZ, R] = FK(handles.thetas);
drawRobot(XYZ,R, handles.axes1);
IK_solution = IK(endEffPos, R(:,:,7));
[~, XYZ2, R2] = FK(IK_solution(1:6,handles.IK_select));
drawRobot(XYZ2,R2, handles.axes2);
upDateTables(handles, IK_solution, handles.thetas, endEffPos, XYZ(6,:), R(:,:,7));
guidata(hObject, handles);
% --- Executes during object creation, after setting all properties.
function angle5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to angle5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
% --- Executes on slider movement.
function angle6_Callback(hObject, eventdata, handles)
% hObject    handle to angle6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

handles.thetas(6) = get(hObject,'Value');
[endEffPos, XYZ, R] = FK(handles.thetas);
drawRobot(XYZ,R, handles.axes1);
IK_solution = IK(endEffPos, R(:,:,7));
[~, XYZ2, R2] = FK(IK_solution(1:6,handles.IK_select));
drawRobot(XYZ2,R2, handles.axes2);
upDateTables(handles, IK_solution, handles.thetas, endEffPos, XYZ(6,:), R(:,:,7));
guidata(hObject, handles);
% --- Executes during object creation, after setting all properties.
function angle6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to angle6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
% --- Executes on selection change in IK_selector.
function IK_selector_Callback(hObject, eventdata, handles)
% hObject    handle to IK_selector (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns IK_selector contents as cell array
%        contents{get(hObject,'Value')} returns selected item from IK_selector

handles.IK_select = get(hObject,'Value');
guidata(hObject, handles);
% --- Executes during object creation, after setting all properties.
function IK_selector_CreateFcn(hObject, eventdata, handles)
% hObject    handle to IK_selector (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

handles.IK_select = 1;
guidata(hObject, handles);
function drawRobot(xyzCoor,R, axesHandles)

%vector length
vl = 0.15;
xplot = 1;
yplot = 1;
zplot = 1;

%Base frame axis direction
a(1,1,:) = R(:,:,1)*[vl 0 0]';
a(1,2,:) = R(:,:,1)*[0 vl 0]';
a(1,3,:) = R(:,:,1)*[0 0 vl]';

%Axis direction frame 1
a(2,1,:) = R(:,:,2)*[vl 0 0]';
a(2,2,:) = R(:,:,2)*[0 vl 0]';
a(2,3,:) = R(:,:,2)*[0 0 vl]';

%Axis direction frame 2
a(3,1,:) = R(:,:,3)*[vl 0 0]';
a(3,2,:) = R(:,:,3)*[0 vl 0]';
a(3,3,:) = R(:,:,3)*[0 0 vl]';

%Axis direction frame 3
a(4,1,:) = R(:,:,4)*[vl 0 0]';
a(4,2,:) = R(:,:,4)*[0 vl 0]';
a(4,3,:) = R(:,:,4)*[0 0 vl]';

%Axis direction frame 4
a(5,1,:) = R(:,:,5)*[vl 0 0]';
a(5,2,:) = R(:,:,5)*[0 vl 0]';
a(5,3,:) = R(:,:,5)*[0 0 vl]';

%Axis direction frame 5
a(6,1,:) = R(:,:,6)*[vl 0 0]';
a(6,2,:) = R(:,:,6)*[0 vl 0]';
a(6,3,:) = R(:,:,6)*[0 0 vl]';

%Axis direction frame 6
a(7,1,:) = R(:,:,7)*[vl 0 0]';
a(7,2,:) = R(:,:,7)*[0 vl 0]';
a(7,3,:) = R(:,:,7)*[0 0 vl]';


axes(axesHandles);
hold on;
cla;

plot3(xyzCoor(:,1),xyzCoor(:,2),xyzCoor(:,3), 'r*');

%plot lines between the axis origins to represent the robot's body
plot3(xyzCoor(:,1),xyzCoor(:,2),xyzCoor(:,3), 'k');

for i=1:7
    plot3([xyzCoor(i,1), xyzCoor(i,1)+ a(i,1,1)], [xyzCoor(i,2), xyzCoor(i,2)+a(i,1,2)], [xyzCoor(i,3),  xyzCoor(i,3)+a(i,1,3)], 'b');
    plot3([xyzCoor(i,1), xyzCoor(i,1)+ a(i,2,1)], [xyzCoor(i,2), xyzCoor(i,2)+a(i,2,2)], [xyzCoor(i,3),  xyzCoor(i,3)+a(i,2,3)], 'r');
    plot3([xyzCoor(i,1), xyzCoor(i,1)+ a(i,3,1)], [xyzCoor(i,2), xyzCoor(i,2)+a(i,3,2)], [xyzCoor(i,3),  xyzCoor(i,3)+a(i,3,3)], 'g');
end

axis([-1*xplot 1*xplot -1*yplot 1*yplot -1*zplot 1*zplot]) 
axis([-0.5*xplot 0.5*xplot -0.5*yplot 0.5*yplot -0.5*zplot 0.5*zplot]) 
function upDateTables(handles, IK, thetas, o6, o5, R06)

set(handles.angleTable, 'data', thetas');
set(handles.endEfftable, 'data', o6);
set(handles.wristCtable, 'data', o5');
set(handles.endEffRottable, 'data', R06);

set(handles.IKtable1, 'data', IK(:,1));
set(handles.IKtable2, 'data', IK(:,2));
set(handles.IKtable3, 'data', IK(:,3));
set(handles.IKtable4, 'data', IK(:,4));

%EDIT THE FOLLOWING TWO FUNCTIONS ONLY


