function varargout = arduino_guide_game_2(varargin)

% ARDUINO_GUIDE_GAME_2 MATLAB code for arduino_guide_game_2.fig
%      ARDUINO_GUIDE_GAME_2, by itself, creates a new ARDUINO_GUIDE_GAME_2 or raises the existing
%      singleton*.
%
%      H = ARDUINO_GUIDE_GAME_2 returns the handle to a new ARDUINO_GUIDE_GAME_2 or the handle to
%      the existing singleton*.
%
%      ARDUINO_GUIDE_GAME_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ARDUINO_GUIDE_GAME_2.M with the given input arguments.
%
%      ARDUINO_GUIDE_GAME_2('Property','Value',...) creates a new ARDUINO_GUIDE_GAME_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before arduino_guide_game_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to arduino_guide_game_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help arduino_guide_game_2

% Last Modified by GUIDE v2.5 16-Feb-2017 15:28:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @arduino_guide_game_2_OpeningFcn, ...
                   'gui_OutputFcn',  @arduino_guide_game_2_OutputFcn, ...
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


% --- Executes just before arduino_guide_game_2 is made visible.
function arduino_guide_game_2_OpeningFcn(hObject, eventdata, handles, varargin)
% Choose default command line output for arduino_guide_game_2
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);



% --- Outputs from this function are returned to the command line.
function varargout = arduino_guide_game_2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function play1_edit_Callback(hObject, eventdata, handles)
% hObject    handle to play1_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of play1_edit as text
%        str2double(get(hObject,'String')) returns contents of play1_edit as a double
play1Name = get(handles.play1_edit, 'String');
assignin('base','play1Name',play1Name);


% --- Executes during object creation, after setting all properties.
function play1_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to play1_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function win_update_Callback(hObject, eventdata, handles)
% hObject    handle to play1_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of play1_edit as text
%        str2double(get(hObject,'String')) return


% --- Executes during object creation, after setting all properties.
function win_update_CreateFcn(hObject, eventdata, handles)
% hObject    handle to play1_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function play2_edit_Callback(hObject, eventdata, handles)
% hObject    handle to play2_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

play2Name = get(handles.play2_edit, 'String');
assignin('base','play2Name',play2Name);


% --- Executes during object creation, after setting all properties.
function play2_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to play2_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in new_round.
function new_round_Callback(hObject, eventdata, handles)
% hObject    handle to new_round (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


if get(handles.new_round,'UserData')==1, return; end
set(handles.new_round,'UserData',1);

while (get(handles.start_button,'UserData') ~= 0)
    set(handles.start_button,'UserData',1);
end



% --- Executes on button press in start_button.
function start_button_Callback(hObject, eventdata, handles)
% hObject    handle to start_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
start_round = 1;
serialPort = '/dev/cu.usbmodem1421';            % define COM port #
s = serial(serialPort);
fopen(s);

%if get(handles.new_round) == 1
 %   start_round=0;
%end

if get(handles.start_button,'UserData')==1, return; end
set(handles.start_button,'UserData',1);

delay = .01;

while (get(handles.start_button,'UserData') ~= 0)
    fprintf(s,'%s',start_round);
    play2_time = 0;
    play1_time = 0;
    dat = fscanf(s,'%f'); %Read Data from Serial as Float
    if(~isempty(dat) && isfloat(dat)) %Make sure Data Type is Correct  
        
        if(dat >= 500000)
            play2_time = dat - 500000;
            set(handles.elapsed2,'String',play2_time);
        end
        
        if(dat <= 499000)
            play1_time = dat - 100000;
            set(handles.elapsed1,'String',play1_time);
        end
    end
    %Allow MATLAB to Update Plot
    pause(delay);
    
    if(play2_time < play1_time)
        set(handles.win_update,'String',get(handles.play1_edit,'String'));
    end
    
    if(play1_time < play2_time)
        set(handles.win_update,'String',get(handles.play2_edit,'String'));
    end
end
