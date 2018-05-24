function varargout = probar(varargin)
% PROBAR MATLAB code for probar.fig
%      PROBAR, by itself, creates a new PROBAR or raises the existing
%      singleton*.
%
%      H = PROBAR returns the handle to a new PROBAR or the handle to
%      the existing singleton*.
%
%      PROBAR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROBAR.M with the given input arguments.
%
%      PROBAR('Property','Value',...) creates a new PROBAR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before probar_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to probar_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help probar

% Last Modified by GUIDE v2.5 23-May-2018 11:28:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @probar_OpeningFcn, ...
                   'gui_OutputFcn',  @probar_OutputFcn, ...
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


% --- Executes just before probar is made visible.
function probar_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to probar (see VARARGIN)

% Choose default command line output for probar
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes probar wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = probar_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

global imgActual
handles.slider1Value = round(get(hObject,'Value'))+1;
imgActual=handles.myimg(:,handles.slider1Value,:);
size(imgActual)

axes(handles.axes1);        
 im(:,:)=imgActual;
 imshow(im);


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.slider2Value = round(get(hObject,'Value'))+1;
imgActual=handles.myimg(:,:,handles.slider2Value);
size(imgActual)

axes(handles.axes2);        
 im2(:,:)=imgActual;
 imshow(im2);
global x1




% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

handles.slider3Value = round(get(hObject,'Value'))+1;
imgActual=handles.myimg(handles.slider3Value,:,:);
size(imgActual)
axes(handles.axes3);        
 im3(:,:)=imgActual;
 imshow(im3);
 
 
% set(handles.text11,'String',num2str(get(hObject,'Value')))
 
%  global z1
%  z1=get(hObject,'Value');
  
% global x1
% x1=get(hObject,'Value');


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)

% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in cargar.
function cargar_Callback(hObject, eventdata, handles)
% hObject    handle to cargar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%clear all; close all; clc;


global V mA

addpath('func/');

addpath('C:\NIfTI_20140122');

V = load_nii('data/image00CompleteMASK.nii')

%mA = squeeze(V.img(:,:,:));
mA = V.img(:,:,:);


%view_nii(V)


% pi = [105     301      81];
% 
 %mA = squeeze(V.img(:,:,pi(3)));
% 
% figure, imshow(mA)



%mi propia variable
handles.myimg=V.img;
%la registro en la tabla de variables
guidata(hObject,handles);


% --- Executes on button press in Punto.
function Punto_Callback(hObject, eventdata, handles)
% hObject    handle to Punto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% global x1 y1 
% 
% [x1,y1]=ginput
% % set(handles.text5,'String',num2str([x,y]))
% 
% set(handles.text5,'String',num2str(x1))
% set(handles.text10,'String',num2str(y1))

global y1 z1 x1 mA V

%[y1,z1]=ginput
% set(handles.text5,'String',num2str([x,y]))

% set(handles.text5,'String',num2str(y1))
% set(handles.text10,'String',num2str(z1))
%set(handles.text11,'String',num2str(get(hObject,'Value')))
%x1=get(handles.tex11)

if get(hObject,'Value')==1
    
    [z1,y1]=ginput
    x1=get(handles.slider3,'Value');
    
    mA = V.img(round(x1),round(y1),round(z1));
    if(mA~=0)
    set(handles.text5,'String',num2str(y1))
    set(handles.text10,'String',num2str(z1))
    set(handles.text11,'String',num2str(x1))
    end 

end

%set(handles.text11,'String',num2str(x1))


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x2 y2 z2 mA V
% [x2,y2]=ginput;
% set(handles.text6,'String',num2str([x2,y2]))

if get(hObject,'Value')==1
    
    [z2,y2]=ginput
    x2=get(handles.slider3,'Value');
    
    mA = V.img(round(x2),round(y2),round(z2));
    if(mA~=0)
    set(handles.text13,'String',num2str(y2))
    set(handles.text14,'String',num2str(z2))
    set(handles.text6,'String',num2str(x2))
    end
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global x1 x2  y1 y2 z1 z2  mA V



if get(hObject,'Value')==1
x=0;
y=0;
z=0;
pasos=0;
distanciaI=sqrt((x2-x1)^2+(y2-y1)^2+(z2-z1)^2)
distancia=distanciaI; 
%distancia=600;
tam=size(mA);


mAA = V.img(:,:,:);

x=x1;
y=y1;
z=z1;
xn=0;
yn=0;
zn=0;

while(distancia>1)
    pasos=pasos+1;
    
    val=vecinos1(x,y,z)
    
    if val(1,1)<distancia 
        xn=val(1,2);
        yn=val(1,3);
        zn=val(1,4);
    end
    
    V.img(round(x),round(y),round(z))=127;
    imgActual= V.img(round(x),round(y),round(z));
    
%     axes(handles.axes3);        
%     im2(:,:)=imgActual;
%     imshow(im2);
 
 
    x=xn;
    y=yn;
    z=zn;
    distancia=val(1,1);
       
end
%      if imgActual(round(x),round(y),round(z))==255
%      V.img(round(x),round(y),round(z))=127;
%      axes(handles.axes3);    
%      im2(:,:)=imgActual;
%      imshow(im2);
%     end

    set(handles.text19,'String',num2str(pasos))
    set(handles.text24,'String',num2str(distancia))
    set(handles.text20,'String',num2str(x))
    set(handles.text21,'String',num2str(y))
    set(handles.text22,'String',num2str(z))
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
