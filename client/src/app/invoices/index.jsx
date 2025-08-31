import React, { Component } from 'react'
import { bindActionCreators } from 'redux'
import { connect } from 'react-redux'
import _ from 'lodash'

import ContentHeader from '../../common/template/ContentHeader'
import Content from '../../common/template/Content'
import List from './List'
import { getList, update, init, create } from './duck'
import FileUploader from "./FileUploader";

class EntityType extends Component {

    //Necessário para gerar o contexto em this.context
    static contextTypes = {
        router: () => null, // replace with PropTypes.object if you use them
    }

    componentWillMount() {
        this.props.init()
        this.props.getList()
    }

    render() {
        if (this.props.match.params.id == 0) {
            this.props.init()
        } else if (this.props.match.params.id && this.props.list.length > 0 && this.props.isEdit === false) {

            const item = _.find(this.props.list, ['id', Number.parseInt(this.props.match.params.id)])
            console.log(item, this.props.match.params.id)
            if (item) {
                this.props.init(item)
            }
        }

        const pathname = this.context.router.route.location.pathname
        const itemId = this.props.match.params.id
        return (
            <div>
                <ContentHeader
                    title={'Notas Fiscais' + (itemId > 0 ? ' - Editando ' + itemId : '') + (itemId == 0 ? ' - Cadastrar Nova ' : '')}
                    small='Gerenciar' />
                <Content>
                    {(typeof itemId === 'undefined') &&
                        <>
                            <FileUploader onUpload={this.props.getList} />
                            <List />
                        </>
                    }
                </Content>
            </div>
        )
    }
}

const mapStateToProps = state => ({
    show: state.invoice.show,
    isEdit: state.form.invoiceForm && state.form.invoiceForm.initial && state.form.invoiceForm.initial.id ? state.form.invoiceForm.initial.id : false,
    list: state.invoice.list
})

const mapDispatchToProps = dispatch => bindActionCreators({
    getList, update, init, create
}, dispatch)
export default connect(mapStateToProps, mapDispatchToProps)(EntityType)