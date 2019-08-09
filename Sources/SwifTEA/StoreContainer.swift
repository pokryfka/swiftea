// MIT License
//
// Copyright (c) 2019 Kevin O'Neill
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import SwiftUI
import WeeDux

public struct StoreContainer<Environment, State, Message, Content>: View where Content: View {
  @ObservedObject private var store: Store<Environment, State, Message>

  private let content: () -> Content

  public var body: some View {
    content()
      .environmentObject(self.store)
      .environmentObject(self.store.dispatcher)
  }

  public init(for store: Store<Environment, State, Message>, content: @escaping () -> Content) {
    self.store = store
    self.content = content
  }
}

#if DEBUG

  struct StoreContainer_Previews: PreviewProvider {
    static var previews: some View {
      StoreContainer(for: stringStore) {
        Text("A")
      }
    }
  }
#endif
