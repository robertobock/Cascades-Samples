/* Copyright (c) 2012 Research In Motion Limited.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import bb.cascades 1.0

// A page with input/output fields for bluetooth/SPP chat
Page {

//! [0]
    paneProperties: NavigationPaneProperties {
        backButton: ActionItem {
            onTriggered: {
                _btController.chatManager.closeSPPConnection()
                navigationPane.pop();
            }
        }
    }
//! [0]

    Container {
        Container {
            background: Color.Black
            preferredHeight: maxHeight
//! [1]
            TextArea {
                textStyle {
                    base: SystemDefaults.TextStyles.SubtitleText
                    fontWeight: FontWeight.Bold
                    color: Color.Yellow
                }

                backgroundVisible: true
                editable: false
                text: _btController.chatManager.chatHistory
            }
//! [1]
        }

        Container {
            leftPadding: 20
            rightPadding: 20
            bottomPadding: 20
            topPadding: 20

            layout: StackLayout {
                orientation: LayoutOrientation.LeftToRight
            }

//! [2]
            TextField {
                id: textInput

                layoutProperties: StackLayoutProperties {
                    spaceQuota: .9
                }

                hintText: qsTr("Type a message to send")

                inputMode: TextAreaInputMode.Chat
                input {
                    submitKey: SubmitKey.Send
                }

                onTextChanged: {
                    if (text.length > 0) {
                        _btController.chatManager.sendSPPMessage(text);
                        textInput.text = ""
                    }
                }
            }
//! [2]
        }
    }
}
