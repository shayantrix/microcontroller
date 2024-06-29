function varargout = Serial_COM1(varargin)
% SERIAL_COM1 MATLAB code for Serial_COM1.fig
%      SERIAL_COM1, by itself, creates a new SERIAL_COM1 or raises the existing
%      singleton*.
%
%      H = SERIAL_COM1 returns the handle to a new SERIAL_COM1 or the handle to
%      the existing singleton*.
%
%      SERIAL_COM1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SERIAL_COM1.M with the given input arguments.
%
%      SERIAL_COM1('Property','Value',...) creates a new SERIAL_COM1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Serial_COM1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Serial_COM1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Serial_COM1

% Last Modified by GUIDE v2.5 26-May-2024 19:58:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Serial_COM1_OpeningFcn, ...
                   'gui_OutputFcn',  @Serial_COM1_OutputFcn, ...
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


% --- Executes just before Serial_COM1 is made visible.
function Serial_COM1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Serial_COM1 (see VARARGIN)

% Choose default command line output for Serial_COM1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Serial_COM1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Serial_COM1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function mydata_Callback(hObject, eventdata, handles)
% hObject    handle to mydata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mydata as text
%        str2double(get(hObject,'String')) returns contents of mydata as a double


% --- Executes during object creation, after setting all properties.
function mydata_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mydata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in send.
function send_Callback(hObject, eventdata, handles)
% hObject    handle to send (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = get( handles.mydata, 'string');
s = serial ('COM2', 'BaudRate', 9600);
fopen(s);
fprintf (s, data);
fclose (s);
delete (s);
